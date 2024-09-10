package
{
    import whack.jscript.lex;

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
        whack.jscript.lex("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return whack.jscript.lex("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return whack.jscript.lex("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return whack.jscript.lex("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return whack.jscript.lex("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return whack.jscript.lex("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return whack.jscript.lex("isNaN")(val);
 
    }

    [Whack::External]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return whack.jscript.lex("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return whack.jscript.lex("parseInt")(str, radix);
    }
}