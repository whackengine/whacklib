package
{
    /**
     * Defines special compiler functions that output specialized JavaScript code
     * for interoperability between ActionScript and JavaScript.
     */
    public static class JSBridge
    {
        /**
        * Conventional namespace used for JavaScript interoperability conversion methods.
        */
        public static namespace from = "http://whack.net/js/bridge/from";

        /**
        * Conventional namespace used for JavaScript interoperability conversion methods.
        */
        public static namespace to = "http://whack.net/js/bridge/to";

        /**
         * Resolves a lexical reference.
         */
        public static native function lexical(name:*):*;

        public static native function toJSArray(obj:*):*;

        public static native function toAS3Array(obj:*):*;

        public static native function toJSPlainObject(obj:*):*;

        public static native function toAS3PlainObject(obj:*):*;

        public static native function toJSFunction(obj:*):*;

        public static native function toAS3Function(obj:*):*;

        public static native function isAS3Object(obj:*):*;

        /**
         * Constructs a JavaScript plain object.
         */
        public static native function newPlainObject():*;

        /**
         * Constructs a JavaScript array.
         */
        public static native function newArray():*;

        /**
         * Returns the `constructor` property of a JavaScript object, or null
         * if the given value is undefined or null.
         */
        public static native function constructorOf(obj:*):*;
    }
}