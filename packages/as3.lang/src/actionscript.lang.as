package
{
    import JS.lex;

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
        JS.lex("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return JS.lex("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return JS.lex("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return JS.lex("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return JS.lex("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return JS.lex("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return JS.lex("isNaN")(val);
 
    }

    [Whack::External]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return JS.lex("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return JS.lex("parseInt")(str, radix);
    }
}