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

        public static native function toJavascriptArray(obj:*):*;

        public static native function toActionscriptArray(obj:*):*;

        public static native function toJavascriptPlainObject(obj:*):*;

        public static native function toActionscriptPlainObject(obj:*):*;

        public static native function toJavascriptFunction(obj:*):*;

        public static native function toActionscriptFunction(obj:*):*;

        public static native function isActionscriptObject(obj:*):*;

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