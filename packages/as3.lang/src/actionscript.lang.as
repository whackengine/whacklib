package
{
    public namespace AS3 = "http://whack.net/AS3/2024/builtin";

    [whack_external]
    public const undefined: * = void 0;

    [whack_external]
    public const NaN: Number = 0 / 0;

    [whack_external]
    public const Infinity: Number = 1 / 0;

    /**
     * Logs the specified values to the console.
     */
    public function trace(...values : [*]):void
    {
        js_bridge.lexical("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return js_bridge.lexical("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return js_bridge.lexical("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return js_bridge.lexical("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return js_bridge.lexical("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return js_bridge.lexical("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return js_bridge.lexical("isNaN")(val);
 
    }

    [whack_external]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return js_bridge.lexical("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return js_bridge.lexical("parseInt")(str, radix);
    }
}