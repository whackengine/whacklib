package
{
    public final class JSON
    {
        private static const m_ns:* = JS.lex("JSON");

        public function JSON()
        {
            throw new Error("Cannot construct a JSON object.");
        }

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
                reviver = AS3_function_to_JS_function(function(k:*, v:*, ctx:*):*
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

        private static function jsjsontoas3json(obj:*):Object
        {
            if (typeof obj == "object")
            {
                const ctor = JS.get_JS_constructor(obj);
                if (ctor === JS.lex("Array"))
                {
                    const r:[*] = [];
                    for each (var v in obj)
                    {
                        r.push(jsjsontoas3json(v));
                    }
                    return r;
                }
                else if (ctor === JS.lex("Object"))
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
                replacer = JS.AS3_function_to_JS_function(replacer);
            }
            else if (replacer is Array)
            {
                replacer = JS.AS3_array_to_JS_array(replacer);
            }

            return m_ns.stringify(as3jsontojsjson(value), replacer, space);
        }

        private static function as3jsontojsjson(val:*):*
        {
            const ctor = get_AS3_constructor(val);
            if (ctor === Array)
            {
                const r = JS.new_array();
                for each (var v in val)
                {
                    r.push(as3jsontojsjson(v));
                }
                return r;
            }
            else if (ctor === Object)
            {
                const r = JS.new_plainobject();
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