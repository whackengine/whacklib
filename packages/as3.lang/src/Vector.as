package
{
    /**
     * Dynamic size collection optimized for numeric types.
     * Indices identifying elements start from the number zero.
     *
     * It is an advantage to use `Vector.<Number>`, `Vector.<float>`, `Vector.<int>`
     * and `Vector.<uint>` over `Array.<Number>`, `Array.<float>`, `Array.<int>` and
     * `Array.<uint>`, as they are represented in a memory-efficient way.
     * 
     * It is allowed to initialize a `Vector` instance through the following expression:
     * 
     * ```
     * new <T> [v1, vN]
     * ```
     */
    [whack_external(slots="4", local="vectorclass")]
    public final class Vector.<T>
    {
        public native function Vector(length:uint = 0, fixed:Boolean = false);

        /**
         * Returns the number of elements in the vector.
         */
        public native function get length():uint;
        public native function set length(val:uint):void;


        public native function get fixed():Boolean;
        public native function set fixed(val:Boolean):void;

        /**
         * Concatenates the vector with the specified vectors or elements
         * into a new vector.
         */
        AS3 native function concat(...args : [*]):Vector.<T>;

        AS3 native function every(callback : function(T,int,Vector.<T>):Boolean, thisObject:* = null):Boolean;

        AS3 native function filter(callback : function(T,int,Vector.<T>):Boolean, thisObject:* = null) : Vector.<T>;

        AS3 native function forEach(callback : function(T,int,Vector.<T>):void, thisObject:* = null):void;

        /**
         * Returns true if the specified item is part of the vector,
         * or false otherwise.
         */
        AS3 native function includes(item:T):Boolean;

        AS3 native function indexOf(searchElement:T, fromIndex:int = 0):int;

        AS3 native function insertAt(index:int, element:T):void;

        /**
         * Converts every element into a string delimiting each of them
         * with the specified separator string.
         */
        AS3 native function join(sep:String):String;

        AS3 native function lastIndexOf(searchElement:T, fromIndex:int = 0x7FFFFFFF):int;

        AS3 native function map(callback : function(T,int,Vector.<T>):*, thisObject:* = null) : Vector.<*>;

        /**
         * Removes the last element of the vector and returns it.
         */
        AS3 native function pop():T;

        /**
         * Inserts the specified arguments to the end of vector.
         */
        AS3 native function push(...args : [T]):uint;

        /**
         * Removes the element from the specified index and returns it.
         */
        AS3 native function removeAt(index:int):T;

        /**
         * Reverses the vector in-place.
         */
        AS3 native function reverse():Vector.<T>;

        /**
         * Removes the first element of the vector and returns it.
         */
        AS3 native function shift():T;

        /**
         * Returns a copy of the vector from the specified indices, where
         * `endIndex` is exclusive.
         */
        AS3 native function slice(fromIndex:int = 0, endIndex:int = 0x7FFFFFFF):Vector.<T>;

        AS3 native function some(callback : function(T,int,Vector.<T>):Boolean, thisObject:* = null):Boolean;

        /**
         * Sorts the vector. This function takes the following signatures:
         * 
         * ```plain
         * function(sortOptions:uint):*
         * function(compareFunction : function(a:T, b:T):int, sortOptions:uint=)
         * ```
         * 
         * The `sortOptions` parameter is a bitwise combination of zero or more of
         * the following constants:
         * 
         * ```
         * Array.CASEINSENSITIVE | Array.DESCENDING | Array.NUMERIC |
         * Array.RETURNINDEXEDARRAY | Array.UNIQUESORT
         * ```
         * 
         * The default sort behavior is to sort elements as strings in ascending order.
         * 
         * @example
         *
         * ```
         * array1.sort(Array.CASEINSENSITIVE | Array.DESCENDiNG);
         * 
         * array2.sort(compareFn, Array.RETURNINDEXEDARRAY);
         * 
         * function compareFn(a:int, b:int):int
         * {
         *     return a - b;
         * }
         * ```
         */
        AS3 native function sort(...args: [*]):Object;

        /**
         * Sorts the vector based in the specified fields.
         * This function takes the following signatures:
         * 
         * ```plain
         * function(fieldName:String, options:uint=):*
         * function(fieldName : [String], options:uint=):*
         * function(fieldName : [String], options : [uint]):*
         * ```
         * 
         * The `options` parameter consists of a `uint` that is a bitwise combination of zero or more of
         * the following constants:
         * 
         * ```
         * Array.CASEINSENSITIVE | Array.DESCENDING | Array.NUMERIC |
         * Array.RETURNINDEXEDARRAY | Array.UNIQUESORT
         * ```
         * 
         * The default sort behavior is to sort elements as strings in ascending order.
         */
        AS3 native function sortOn(fieldName:Object, options:Object = null):Object;

        /**
         * Removes a count of elements from the specified index, then adds
         * the specified values at the specified index and returns the
         * removed elements back.
         */
        AS3 native function splice(startIndex:int, deleteCount:uint, ...values : [T]):Vector.<T>;

        /**
         * Inserts the specified arguments to the beginning of the array.
         */
        AS3 native function unshift(...args : [T]):uint;
    }
}