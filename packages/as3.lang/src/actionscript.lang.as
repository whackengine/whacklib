package
{
    import sw.externals.js.lex;

    [SW::External]
    public namespace AS3 = "http://skywhack.net/AS3/2024/builtin";

    [SW::External]
    public const undefined: * = void 0;

    [SW::External]
    public const NaN: Number = 0 / 0;

    [SW::External]
    public const Infinity: Number = 1 / 0;

    /**
     * Logs the specified values to the console.
     */
    public function trace(...values : [*]):void
    {
        sw.externals.js.lex("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return sw.externals.js.lex("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return sw.externals.js.lex("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return sw.externals.js.lex("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return sw.externals.js.lex("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return sw.externals.js.lex("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return sw.externals.js.lex("isNaN")(val);
 
    }

    [SW::External]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return sw.externals.js.lex("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return sw.externals.js.lex("parseInt")(str, radix);
    }
}