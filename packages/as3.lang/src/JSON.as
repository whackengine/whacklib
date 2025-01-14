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
            if (Reflect.isArrayType(type))
            {
                //
            }
            else if (Reflect.isVectorType(type))
            {
                //
            }
            else if (Reflect.isMapType(type))
            {
                //
            }
            else if (Reflect.isTupleType(type))
            {
                //
            }
            else if (!type)
            {
                //
            }
            else
            {
                //
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