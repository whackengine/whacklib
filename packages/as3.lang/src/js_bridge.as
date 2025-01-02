package
{
    /**
     * Namespace used for JavaScript conversion methods.
     */
    public namespace js_from = "http://whack.net/js/bridge/from";

    /**
     * Namespace used for JavaScript conversion methods.
     */
    public namespace js_to = "http://whack.net/js/bridge/to";

    /**
     * Defines special compiler functions that output specialized JavaScript code
     * for interoperability between ActionScript and JavaScript.
     */
    public final class js_bridge
    {
        public function js_bridge()
        {
            throw new Error("Cannot construct the JS class.");
        }

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

        public static native function newPlainObject():*;

        public static native function newArray():*;

        /**
         * Alternative to getting the `constructor` property in ActionScript 3.
         */
        public static native function actionscriptConstructor(obj):*;

        public static native function javascriptConstructor(obj):*;
    }
}