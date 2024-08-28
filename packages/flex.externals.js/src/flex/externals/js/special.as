/**
 * Defines special compiler functions that output specialized JavaScript code.
 */
package flex.externals.js
{
    /**
     * Host JavaScript compiler function: immediately invoked function expression
     * taking the specified parameters.
     * 
     * @example
     * 
     * ```
     * import flex.externals.js.iife;
     * 
     * const z = flex.externals.js.iife(<![CDATA[
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
    public native function as3arraytojsarray(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function jsarraytoas3array(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function as3plainobjtojsplainobj(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function jsplainobjtojsplainobj(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function as3functojsfunc(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function jsfunctoas3func(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function isas3obj(obj:*):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function newplainobj():*;

    /**
     * Host JavaScript compiler function.
     */
    public native function newarray():*;

    /**
     * Host JavaScript compiler function.
     */
    public native function getas3constructor(obj):*;

    /**
     * Host JavaScript compiler function.
     */
    public native function getjsconstructor(obj):*;
}