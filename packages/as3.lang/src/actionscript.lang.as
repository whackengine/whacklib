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
        values = values.map(function(val:*):*
        {
            if (val is Array || JSBridge.actionscriptConstructor(val) === Object)
            {
                return JSBridge.lexical("JSON").parse(JSON.stringify(val));
            }
            return val;
        });
        JSBridge.lexical("console").log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return JSBridge.lexical("decodeURI")(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return JSBridge.lexical("decodeURIComponent")(str);
    }

    public function encodeURI(str:String):String
    {
        return JSBridge.lexical("encodeURI")(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return JSBridge.lexical("encodeURIComponent")(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return JSBridge.lexical("isFinite")(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return JSBridge.lexical("isNaN")(val);
 
    }

    [whack_external]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return JSBridge.lexical("parseFloat")(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return JSBridge.lexical("parseInt")(str, radix);
    }
}