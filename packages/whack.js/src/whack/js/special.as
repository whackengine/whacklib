/**
 * Defines special compiler functions that output specialized JavaScript code.
 */
package whack.js
{
    /**
     * Host JavaScript compiler function: immediately invoked function expression
     * taking the specified parameters.
     * 
     * @example
     * 
     * ```
     * import whack.js.iife;
     * 
     * const z = whack.js.iife(<![CDATA[
     *     return x + y;
     * ]]>, x, y);
     * ```
     */
    public native function iife(source:*, ...params : [*]):*;

    /**
     * Host JavaScript compiler function: resolves a lexical reference.
     */
    public native function lex(name:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function get(obj:*, key:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function set(obj:*, key:*, value:*):void;

    /**
     * Host JavaScript compiler function.
     */
    public native function callkey(obj:*, key:*, ...rest : [*]):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function callkeyspread(obj:*, key:*, rest : [*]):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function construct(obj:*, ...rest : [*]):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function constructspread(obj:*, rest : [*]):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function AS3_array_to_JS_array(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function JS_array_to_AS3_array(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function AS3_plainobject_to_JS_plainobject(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function JS_plainobject_to_AS3_plainobject(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function AS3_function_to_JS_function(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function JS_function_to_AS3_function(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function is_AS3_object(obj:*):*;

    /**
     * Host JavaScript compiler function for constructing a JavaScript plain object.
     */
    public native function new_plainobject():*;

    /**
     * Host JavaScript compiler function for constructing a JavaScript array.
     */
    public native function new_array():*;

    /**
     * Host JavaScript compiler function.
     */
    public native function get_AS3_constructor(obj):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function get_JS_constructor(obj):*;
}