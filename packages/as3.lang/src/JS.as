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
        public native function lex(name:*):*;

        public native function get(obj:*, key:*):*;

        public native function set(obj:*, key:*, value:*):void;

        public native function callk(obj:*, key:*, ...rest : [*]):*;

        public native function callkspread(obj:*, key:*, rest : [*]):*;

        public native function construct(obj:*, ...rest : [*]):*;

        public native function constructspread(obj:*, rest : [*]):*;

        public native function AS3_array_to_JS_array(obj:*):*;

        public native function JS_array_to_AS3_array(obj:*):*;

        public native function AS3_plainobject_to_JS_plainobject(obj:*):*;

        public native function JS_plainobject_to_AS3_plainobject(obj:*):*;

        public native function AS3_function_to_JS_function(obj:*):*;

        public native function JS_function_to_AS3_function(obj:*):*;

        public native function is_AS3_object(obj:*):*;

        public native function new_plainobject():*;

        public native function new_array():*;

        public native function get_AS3_constructor(obj):*;

        public native function get_JS_constructor(obj):*;
    }
}