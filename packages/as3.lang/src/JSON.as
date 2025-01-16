package
{
    public static class JSON
    {
        private static const m_ns:* = JSBridge.lexical("JSON");

        /**
         * Parses a JSON formatted string.
         * 
         * @param reviver A function of a (`k`, `v`, `context`) signature for filtering or transforming
         * key value pairs while parsing the JSON string. `context` is passed only when
         * reviving primitive values, and contains a `source` property containing
         * the original JSON string of the value.
         */
        public static function parse(text:String, reviver : function(*, *, Object):* = null):Object
        {
            if (reviver)
            {
                reviver = toJavascriptFunction(function(k:*, v:*, ctx:*):*
                {
                    if (ctx)
                    {
                        const k = ctx;
                        ctx = {};
                        ctx.source = k.source;
                    }
                    return reviver(k, v, ctx);
                });
            }
            var r = m_ns.parse(text, reviver);
            return jsjsontoas3json(r);
        }

        /**
         * Parses a JSON formatted string as a given type.
         */
        public static function parseAs(text:String, type:Class):Object
        {
            return mapParsedIntoType(parse(text), type);
        }

        private static function mapParsedIntoType(val:*, type:Class):Object
        {
            if (type == String)
            {
                if (typeof val != "string")
                {
                    throw new TypeError("Expected string, got " + (typeof val) + ".");
                }
                return val;
            }
            else if (type == Number)
            {
                if (typeof val != "number")
                {
                    throw new TypeError("Expected number, got " + (typeof val) + ".");
                }
                return val;
            }
            else if (type == Boolean)
            {
                if (typeof val != "boolean")
                {
                    throw new TypeError("Expected boolean, got " + (typeof val) + ".");
                }
                return val;
            }
            else if (type == int)
            {
                if (typeof val != "number")
                {
                    throw new TypeError("Expected int, got " + (typeof val) + ".");
                }
                return int(val);
            }
            else if (type == uint)
            {
                if (typeof val != "number")
                {
                    throw new TypeError("Expected uint, got " + (typeof val) + ".");
                }
                return uint(val);
            }
            else if (type == float)
            {
                if (typeof val != "number")
                {
                    throw new TypeError("Expected float, got " + (typeof val) + ".");
                }
                return float(val);
            }
            else if (Reflect.isArrayType(type) || Reflect.isVectorType(type))
            {
                if (!isArray(val))
                {
                    throw new TypeError("Expected array, got " + (typeof val) + ".");
                }
                
                const [elementType] = Reflect.typeArguments(type);
                const r = new type();

                for each (const el in val)
                {
                    r.push(mapParsedIntoType(el, elementType));
                }

                return r;
            }
            else if (Reflect.isMapType(type))
            {
                const [keyType, valueType] = Reflect.typeArguments(type);

                if ([null, Object, String].indexOf(keyType) == -1)
                {
                    throw new TypeError("Map key type must be *, Object or String.");
                }

                if (!(typeof val == "object" && val.constructor === Object))
                {
                    throw new TypeError("Expected plain object, got " + (typeof val));
                }

                const r = new type();

                for (var k in val)
                {
                    r[k] = mapParsedIntoType(val[k], valueType);
                }

                return r;
            }
            else if (Reflect.isTupleType(type))
            {
                const elementTypes = Reflect.tupleTypeElements(type);

                if (!isArray(val))
                {
                    throw new TypeError("Expected array, got " + (typeof val) + ".");
                }

                const elements = [];
                const len = elementTypes.length;

                if (len != val.length)
                {
                    throw new TypeError("Wrong tuple length: expected " + len + ", got " + val.length + ".");
                }

                for (var i:int = 0; i < len; i++)
                {
                    const elem = val[i];
                    const elemType = elementTypes[i];
                    elements.push(mapParsedIntoType(el, elemType));
                }

                return Reflect.constructTuple(elementTypes, elements);
            }
            else if (!type)
            {
                return val;
            }
            else
            {
                const serialization1 = Reflect.lookupMetadata(type, "Serialization");
                if (serialization1 !== null)
                {
                    for each (var [k, v] in serialization1.entries)
                    {
                        if (k == "tag")
                        {
                            if (typeof val != "object")
                            {
                                throw new TypeError("Expected object, got " + (typeof val) + ".");
                            }
                            const r = mapParsedIntoSubclass(val, type, v, String(val[v]));
                            if (r === null)
                            {
                                throw new TypeError("Could not find " + Reflect.typeFullName(type) + " subclass matching the tag '" + val[v] + "'.");
                            }
                            return r;
                        }
                        else if (k == "format")
                        {
                            if (typeof val != "string)
                            {
                                throw new TypeError("Expected string, got " + (typeof val) + ".");
                            }
                            return mapFormattedStringIntoType(val, type, v);
                        }
                        else if (k == "union")
                        {
                            if (v == "true)
                            {
                                return mapUnionIntoType(val, type);
                            }
                        }
                    }
                }

                if (typeof val != "object")
                {
                    throw new TypeError("Expected object, got " + (typeof val) + ".");
                }
                return mapParsedIntoSpecificClass(val, type);
            }
        }

        private static function mapParsedIntoSubclass(obj:*, type:Class, tagProperty:String, searchTagName:String):Object
        {
            const serialization1 = Reflect.lookupMetadata(type, "Serialization");
            var tagName:String = null;
            if (serialization1 !== null)
            {
                for each (var [k, v] in serialization1.entries)
                {
                    if (k == "tag")
                    {
                        if (tagProperty != v)
                        {
                            throw new Error("Serialization.tag diverges from base class in subclass " + Reflect.typeFullName(type) + ".");
                        }
                    }
                    else if (k == "rename")
                    {
                        tagName = v;
                    }
                }
            }

            tagName ??= Reflect.typeLocalName(type);

            if (tagName == searchTagName)
            {
                // Deserialize that class
                return mapParsedIntoSpecificClass(obj, type);
            }

            for each (const subclass in Reflect.subclasses(type))
            {
                const r = mapParsedIntoSubclass(obj, subclass, tagProperty, searchTagName);
                if (r !== null)
                {
                    return r;
                }
            }

            return null;
        }

        private static function mapParsedIntoSpecificClass(obj:*, type:Class):Object
        {
            const r = new type();
            vars: for each (const variable in Reflect.variables(type))
            {
                if (variable.namespace !== null)
                {
                    continue;
                }
                var jsonField:String = variable.name;
                for each (const metadata in variable.metadata)
                {
                    if (metadata.name == "Serialization")
                    {
                        for each (const [k, v] in metadata.entries)
                        {
                            if (k == "rename")
                            {
                                jsonField = v;
                            }
                            else if (k == "skip")
                            {
                                if (v == "true")
                                {
                                    continue vars;
                                }
                            }
                        }
                        break;
                    }
                }
                r[variable.name] = mapParsedIntoType(obj[jsonField], variable.type);
            }
            return r;
        }

        private static function mapFormattedStringIntoType(formattedStr:String, type:Class, format:String):Object
        {
            // Cast each property interpolation to the property type
            const r = new type();
            var i:int = 0
            ,   fl:int = format.length
            ,   formattedStrIndex:int = 0
            ,   formattedStrLen:int = formattedStr.length;
            while (i < fl)
            {
                var ch = format.charCodeAt(i++);
                if (ch == 0x7B)
                {
                    var intpStart = i;
                    var rbrace = false;
                    while (i < fl)
                    {
                        ch = format.charCodeAt(i++);
                        if (ch == 0x7D)
                        {
                            rbrace = true;
                            break;
                        }
                    }
                    const propertyName = format.slice(intpStart, i - (rbrace ? 1 : 0));
                    var propertyValue:* = "";
                    if (i < fl)
                    {
                        const nextFormatChar = format.charAt(i);
                        const formattedStrNextIndex = formattedStr.indexOf(nextFormatChar, formattedStrIndex);
                        propertyValue = formattedStrNextIndex == -1 ? "" : formattedStr.slice(formattedStrIndex, formattedStrNextIndex);
                    }
                    else
                    {
                        propertyValue = formattedStr.slice(formattedStrIndex);
                    }

                    const propertyType = Reflect.propertyType(type, propertyName);
                    if (propertyType !== null)
                    {
                        propertyValue = propertyType(propertyValue);
                    }
                    r[propertyName] = propertyValue;
                }
                else if (formattedStrIndex < formattedStrLen)
                {
                    formattedStrIndex++;
                }
            }
            return r;
        }

        private static function mapUnionIntoType(val:*, type:Class):Object
        {
            if (typeof val == "string")
            {
                for each (var subclass in Reflect.subclasses(type))
                {
                    var serialization = Reflect.lookupMetadata(subclass, "Serialization");
                    if (serialization === null)
                    {
                        continue;
                    }
                    var isStringFound = false, fieldName:String = null;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "string")
                        {
                            if (v == "true")
                            {
                                isStringFound = true;
                            }
                        }
                        else if (k == "field")
                        {
                            fieldName = v;
                        }
                    }
                    if (isStringFound && fieldName != null)
                    {
                        const r = new subclass();
                        r[fieldName] = val;
                        return r;
                    }
                }
                throw new Error("Could not deserialize string into union.");
            }
            else if (isArray(val))
            {
                for each (var subclass in Reflect.subclasses(type))
                {
                    var serialization = Reflect.lookupMetadata(subclass, "Serialization");
                    if (serialization === null)
                    {
                        continue;
                    }
                    var isArrayFound = false, fieldName:String = null;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "array")
                        {
                            if (v == "true")
                            {
                                isArrayFound = true;
                            }
                        }
                        else if (k == "field")
                        {
                            fieldName = v;
                        }
                    }
                    if (isArrayFound && fieldName != null)
                    {
                        const propertyType = Reflect.propertyType(subclass, fieldName);
                        if (propertyType !== null)
                        {
                            val = mapParsedIntoType(val, propertyType);
                        }
                        const r = new subclass();
                        r[fieldName] = val;
                        return r;
                    }
                }
                throw new Error("Could not deserialize array into union.");
            }
            else if (typeof val == "object")
            {
                for each (var subclass in Reflect.subclasses(type))
                {
                    var serialization = Reflect.lookupMetadata(subclass, "Serialization");
                    if (serialization === null)
                    {
                        continue;
                    }
                    var isObjectFound = false, fieldName:String = null;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "object")
                        {
                            if (v == "true")
                            {
                                isObjectFound = true;
                            }
                        }
                        else if (k == "field")
                        {
                            fieldName = v;
                        }
                    }
                    if (isObjectFound && fieldName != null)
                    {
                        return mapParsedIntoSpecificClass(val, subclass);
                    }
                }
                throw new Error("Could not deserialize object into union.");
            }
            else if (typeof val == "number")
            {
                for each (var subclass in Reflect.subclasses(type))
                {
                    var serialization = Reflect.lookupMetadata(subclass, "Serialization");
                    if (serialization === null)
                    {
                        continue;
                    }
                    var isNumberFound = false, fieldName:String = null;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "number")
                        {
                            if (v == "true")
                            {
                                isNumberFound = true;
                            }
                        }
                        else if (k == "field")
                        {
                            fieldName = v;
                        }
                    }
                    if (isNumberFound && fieldName != null)
                    {
                        const propertyType = Reflect.propertyType(subclass, fieldName);
                        if (propertyType !== null)
                        {
                            val = propertyType(val);
                        }
                        const r = new subclass();
                        r[fieldName] = val;
                        return r;
                    }
                }
                throw new Error("Could not deserialize string into union.");
            }
            else if (typeof val == "boolean")
            {
                for each (var subclass in Reflect.subclasses(type))
                {
                    var serialization = Reflect.lookupMetadata(subclass, "Serialization");
                    if (serialization === null)
                    {
                        continue;
                    }
                    var isBooleanFound = false, fieldName:String = null;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "boolean")
                        {
                            if (v == "true")
                            {
                                isBooleanFound = true;
                            }
                        }
                        else if (k == "field")
                        {
                            fieldName = v;
                        }
                    }
                    if (isBooleanFound && fieldName != null)
                    {
                        const r = new subclass();
                        r[fieldName] = Boolean(val);
                        return r;
                    }
                }
                throw new Error("Could not deserialize boolean into union.");
            }
            else
            {
                throw new Error("Unknown value type for union.");
            }
        }

        private static function jsjsontoas3json(obj:*):Object
        {
            if (typeof obj == "object")
            {
                const ctor = JSBridge.javascriptConstructor(obj);
                if (ctor === JSBridge.lexical("Array"))
                {
                    const r:[*] = [];
                    for each (var v in obj)
                    {
                        r.push(jsjsontoas3json(v));
                    }
                    return r;
                }
                else if (ctor === JSBridge.lexical("Object"))
                {
                    const r = {};
                    for (var k in obj)
                    {
                        r[k] = jsjsontoas3json(obj[k]);
                    }
                    return r;
                }
            }
            return obj;
        }

        public static function stringify(value:Object, replacer:* = null, space:* = null):String
        {
            if (replacer is Function)
            {
                replacer = JSBridge.toJavascriptFunction(replacer);
            }
            else if (isArray(replacer))
            {
                replacer = JSBridge.toJavascriptArray(replacer);
            }

            return m_ns.stringify(as3jsontojsjson(value), replacer, space);
        }

        private static function as3jsontojsjson(val:*):*
        {
            const ctor = JSBridge.actionscriptConstructor(val);
            if (ctor === Array)
            {
                const r = JSBridge.newArray();
                for each (var v in val)
                {
                    r.push(as3jsontojsjson(v));
                }
                return r;
            }
            else if (ctor === Object)
            {
                const r = JSBridge.newPlainObject();
                for (var k in val)
                {
                    r[k] = as3jsontojsjson(val[k]);
                }
                return r;
            }
            else
            {
                return val;
            }
        }
    }
}