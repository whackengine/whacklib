package
{
    public static class JSON
    {
        private static const m_ns:JSVal = JSBridge.lexical("JSON");

        /**
         * Parses a JSON formatted string. If `argument2` is specified as a `Class` object,
         * then parses the JSON string into an instance of that class.
         * 
         * @param argument2 Either a data type or a reviver as a function of a (`k`, `v`, `context`) signature for filtering or transforming
         * key value pairs while parsing the JSON string. For reviver, `context` is passed only when
         * reviving primitive values, and contains a `source` property containing
         * the original JSON string of the value.
         */
        public static function parse(text:String, argument2:* = null):Object
        {
            var reviver:Function = null;
            if (argument2 is Function)
            {
                const reviverOrig:Function = argument2;
                reviver = JSBridge.toJSFunction(function(k:*, v:*, ctx:*):*
                {
                    if (ctx)
                    {
                        const k = ctx;
                        ctx = {};
                        ctx.source = k.source;
                    }
                    return reviverOrig(k, v, ctx);
                });
            }
            else if (argument2 is Class)
            {
                return mapParsedIntoType(parse(text), argument2);
            }
            var r = m_ns.parse(text, reviver);
            return jsjsontoas3json(r);
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
                    elements.push(mapParsedIntoType(elem, elemType));
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
                                throw new TypeError("Could not find " + Reflect.qualifiedName(type) + " subclass matching the tag '" + val[v] + "'.");
                            }
                            return r;
                        }
                        else if (k == "union")
                        {
                            if (v == "true")
                            {
                                return mapUnionIntoType(val, type);
                            }
                        }
                    }
                }

                // fromJSON()
                if (Reflect.hasMethod(type, "fromJSON"))
                {
                    return type["fromJSON"](val);
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
                            throw new Error("Serialization.tag diverges from base class in subclass " + Reflect.qualifiedName(type) + ".");
                        }
                    }
                    else if (k == "rename")
                    {
                        tagName = v;
                    }
                }
            }

            tagName ??= Reflect.localName(type);

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
            if (!Reflect.isClass(type))
            {
                throw new TypeError("Cannot parse JSON into non class type " + + Reflect.qualifiedName(type) + ".");
            }
            if (!Reflect.hasOptionalConstructor(type))
            {
                throw new TypeError("Cannot parse JSON into " + Reflect.qualifiedName(type) + " as its constructor is not optional.");
            }
            const r = new type();
            vars: for each (const variable in Reflect.properties(type))
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
                        else
                        {
                            val = val.slice(0);
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
                    var isObjectFound = false;
                    for each (const [k, v] in serialization.entries)
                    {
                        if (k == "object")
                        {
                            if (v == "true")
                            {
                                isObjectFound = true;
                            }
                        }
                    }
                    if (isObjectFound)
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
                throw new Error("Could not deserialize number into union.");
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
                const ctor = obj?.constructor;
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
            // If the value to serialize is an user class, convert it to JSON before
            // serializing it.
            const ctor = Reflect.getConstructor(value);
            if (typeof value == "object" && ctor !== Object)
            {
                value = serializableToPlain(value);
            }

            if (replacer is Function)
            {
                replacer = JSBridge.toJSFunction(replacer);
            }
            else if (isArray(replacer))
            {
                replacer = JSBridge.toJSArray(replacer);
            }

            return m_ns.stringify(as3jsontojsjson(value), replacer, space);
        }

        private static function serializableToPlain(val:*):Object
        {
            if (val === undefined || val === null)
            {
                return null;
            }
            if (typeof val == "number" || typeof val == "boolean" || typeof val == "string")
            {
                return val;
            }
            if (isArray(val) || isVector(val) || isTuple(val))
            {
                const r : [*] = [];
                for each (var el in val)
                {
                    r.push(serializableToPlain(el));
                }
                return r;
            }
            const ctor = Reflect.getConstructor(val);

            // Plain object
            if (ctor == Object || isMap(val))
            {
                if (isMap(val) && val.weak())
                {
                    throw new TypeError("Cannot serialize weak Map.");
                }
                const r:Object = {};
                for (var k in val)
                {
                    r[k] = serializableToPlain(val[k]);
                }
                return r;
            }

            const serialization = Reflect.lookupMetadata(ctor, "Serialization");

            var tagName:String = null;

            if (serialization)
            {
                var fieldName:String = null;

                for each (var [k, v] in serialization.entries)
                {
                    if (k == "field")
                    {
                        fieldName = v;
                    }
                    else if (k == "rename")
                    {
                        tagName = v;
                    }
                }

                for each (var [k, v] in serialization.entries)
                {
                    if (k == "string")
                    {
                        if (v == "true")
                        {
                            return String(val[fieldName]);
                        }
                    }
                    else if (k == "number")
                    {
                        if (v == "true")
                        {
                            return Number(val[fieldName]);
                        }
                    }
                    else if (k == "object")
                    {
                        if (v == "true")
                        {
                            return serializableToPlain(val);
                        }
                    }
                    else if (k == "array")
                    {
                        if (v == "true")
                        {
                            return serializableToPlain(val[fieldName]);
                        }
                    }
                    else if (k == "boolean")
                    {
                        if (v == "true")
                        {
                            return Boolean(val[fieldName]);
                        }
                    }
                }
            }

            var c1 = Reflect.superType(ctor);
            while (c1 !== null)
            {
                const serialization = Reflect.lookupMetadata(c1, "Serialization");
                if (serialization)
                {
                    for each (var [k, v] in serialization.entries)
                    {
                        if (k == "tag")
                        {
                            const r = serializableToPlain(val);
                            r[v] = tagName ?? Reflect.localName(ctor);
                            return r;
                        }
                    }
                }

                c1 = Reflect.superType(c1);
            }

            if (Reflect.hasMethod(val, "toJSON"))
            {
                return val.toJSON();
            }

            return specificSerializableTypedObjectToPlain(val, ctor);
        }

        private static function specificSerializableTypedObjectToPlain(obj:*, type:Class):Object
        {
            const r:Object = {};

            vars: for each (var variable in Reflect.properties(type))
            {
                if (variable.naemspace !== null)
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

                r[jsonField] = serializableToPlain(obj[variable.name]);
            }

            return r;
        }

        private static function as3jsontojsjson(val:*):*
        {
            if (isArray(val))
            {
                const r = JSBridge.newArray();
                for each (var v in val)
                {
                    r.push(as3jsontojsjson(v));
                }
                return r;
            }
            else if (Reflect.getConstructor(val) === Object)
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