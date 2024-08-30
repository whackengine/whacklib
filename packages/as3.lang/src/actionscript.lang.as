package
{
    import whack.externals.js.lex;

    [Whack::External]
    public namespace AS3 = "http://whack.net/AS3/2024/builtin";

    [Whack::External]
    public const undefined: * = void 0;

    [Whack::External]
    public const NaN: Number = 0 / 0;

    [Whack::External]
    public const Infinity: Number = 1 / 0;

    /**
     * Logs the specified values to the console.
     */
    public function trace(...values : [*]):void
    {
        whack.externals.js.lex("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return whack.externals.js.lex("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return whack.externals.js.lex("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return whack.externals.js.lex("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return whack.externals.js.lex("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return whack.externals.js.lex("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return whack.externals.js.lex("isNaN")(val);
 
    }

    [Whack::External]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return whack.externals.js.lex("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return whack.externals.js.lex("parseInt")(str, radix);
    }
}