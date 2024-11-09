package
{
    /**
     * Defines special compiler functions that output specialized JavaScript code
     * for interoperability between ActionScript and JavaScript.
     */
    public final class js_interop
    {
        public function js_interop()
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

        public static native function actionscriptConstructor(obj):*;

        public static native function javascriptConstructor(obj):*;
    }
}