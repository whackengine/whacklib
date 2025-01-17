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
        JSVal(JSBridge.lexical("console")).log(values.join("  "));
    }

    public function decodeURI(str:String):String
    {
        return JSVal(JSBridge.lexical("decodeURI"))(str);
    }

    public function decodeURIComponent(str:String):String
    {
        return (JSBridge.lexical("decodeURIComponent") as JSVal)(str);
    }

    public function encodeURI(str:String):String
    {
        return (JSBridge.lexical("encodeURI") as as JSVal)(str);
    }

    public function encodeURIComponent(str:String):String
    {
        return (JSBridge.lexical("encodeURIComponent") as JSVal)(str);
    }

    public function isFinite(val:Number):Boolean
    {
        return JSVal(JSBridge.lexical("isFinite"))(val);
    }

    public function isNaN(val:Number):Boolean
    {
        return JSVal(JSBridge.lexical("isNaN"))(val);
    }

    /**
     * Determines whether a given argument is an `Array` object.
     * This function is preferred over the expression `arg is Array`
     * since the latter will test for `Array.<*>` in specific.
     */
    [whack_external]
    public native function isArray(arg:*):Boolean;

    /**
     * Determines whether a given argument is a `Map` object.
     * This function is preferred over the expression `arg is Map`
     * since the latter will test for `Map.<*>` in specific.
     */
    [whack_external]
    public native function isMap(arg:*):Boolean;

    /**
     * Determines whether a given argument is a `Vector` object.
     * This function is preferred over the expression `arg is Vector`
     * since the latter will test for `Vector.<*>` in specific.
     */
    [whack_external]
    public native function isVector(arg:*):Boolean;

    /**
     * Determines whether a given argument is a tuple object.
     */
    [whack_external]
    public native function isTuple(arg:*):Boolean;

    [whack_external]
    public native function isXMLName(str:String):Boolean;

    public function parseFloat(str:String):Number
    {
        return JSVal(JSBridge.lexical("parseFloat"))(str);
    }

    public function parseInt(str:String, radix:uint = 0):Number
    {
        return JSVal(JSBridge.lexical("parseInt"))(str, radix);
    }
}