package
{
    /**
     * Defines special compiler functions that output specialized JavaScript code
     * for interoperability between ActionScript and JavaScript.
     */
    public final class JS
    {
        public function JS()
        {
            throw new Error("Cannot construct the JS class.");
        }

        /**
        * Resolves a lexical reference.
        */
        public static native function lex(name:*):*;

        public static native function get(obj:*, key:*):*;

        public static native function set(obj:*, key:*, value:*):void;

        public static native function callk(obj:*, key:*, ...rest : [*]):*;

        public static native function callkspread(obj:*, key:*, rest : [*]):*;

        public static native function construct(obj:*, ...rest : [*]):*;

        public static native function constructspread(obj:*, rest : [*]):*;

        public static native function AS3_array_to_JS_array(obj:*):*;

        public static native function JS_array_to_AS3_array(obj:*):*;

        public static native function AS3_plainobject_to_JS_plainobject(obj:*):*;

        public static native function JS_plainobject_to_AS3_plainobject(obj:*):*;

        public static native function AS3_function_to_JS_function(obj:*):*;

        public static native function JS_function_to_AS3_function(obj:*):*;

        public static native function is_AS3_object(obj:*):*;

        public static native function new_plainobject():*;

        public static native function new_array():*;

        public static native function get_AS3_constructor(obj):*;

        public static native function get_JS_constructor(obj):*;
    }
}