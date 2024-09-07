package
{
    import whack.js.lex;

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
        whack.js.lex("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return whack.js.lex("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return whack.js.lex("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return whack.js.lex("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return whack.js.lex("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return whack.js.lex("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return whack.js.lex("isNaN")(val);
 
    }

    [Whack::External]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return whack.js.lex("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return whack.js.lex("parseInt")(str, radix);
    }
}