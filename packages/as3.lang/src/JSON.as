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
                if (typeof val != "object")
                {
                    throw new TypeError("Expected object, got " + (typeof val) + ".");
                }
                const serialization1 = Reflect.lookupMetadata(type, "Serialization");
                if (serialization1 !== null)
                {
                    for each (var [k, v] in serialization1.entries)
                    {
                        if (k == "tag")
                        {
                            const r = mapParsedIntoSubclass(val, type, v, String(val[v]));
                            if (r === null)
                            {
                                throw new TypeError("Could not find " + Reflect.typeFullName(type) + " subclass matching the tag '" + val[v] + "'.");
                            }
                            return r;
                        }
                        else if (k == "format")
                        {
                            //
                            throw new Error("Not implemented.");
                        }
                        else if (k == "union")
                        {
                            //
                            throw new Error("Not implemented.");
                        }
                    }
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