package
{
    /**
     * Dynamic size collection. Indices identifying elements start from the number zero.
     */
    [Whack::External(slots="3")]
    public dynamic class Array.<T>
    {
        public native function Array(...values : [*]);

        /**
         * Returns the number of elements in the array.
         */
        public native function get length():uint;
        public native function set length(val:uint):void;

        /**
         * Concatenates the array with the specified arrays or elements
         * into a new array.
         */
        AS3 native function concat(...args : [*]):[T];

        AS3 native function every(callback : function(T,int,[T]):Boolean, thisObject:* = null):Boolean;

        AS3 native function filter(callback : function(T,int,[T]):Boolean, thisObject:* = null) : [T];

        AS3 native function forEach(callback : function(T,int,[T]):void, thisObject:* = null):void;

        /**
         * Returns true if the specified item is part of the array,
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

        AS3 native function map(callback : function(T,int,[T]):*, thisObject:* = null) : *;

        /**
         * Removes the last element of the array and returns it.
         */
        AS3 native function pop():T;

        /**
         * Inserts the specified arguments to the end of array.
         */
        AS3 native function push(...args : [T]):uint;

        /**
         * Removes the element from the specified index and returns it.
         */
        AS3 native function removeAt(index:int):T;

        /**
         * Reverses the array in-place.
         */
        AS3 native function reverse():[T];

        /**
         * Removes the first element of the array and returns it.
         */
        AS3 native function shift():T;

        /**
         * Returns a copy of the array from the specified indices, where
         * `endIndex` is exclusive.
         */
        AS3 native function slice(fromIndex:int = 0, endIndex:int = 0x7FFFFFFF):[T];

        AS3 native function some(callback : function(T,int,[T]):Boolean, thisObject:* = null):Boolean;

        /**
         * Sorts the array. This function takes the following signatures:
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
         * Sorts the array based in the specified fields.
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
        AS3 native function splice(startIndex:int, deleteCount:uint, ...values : [T]):[T];

        /**
         * Inserts the specified arguments to the beginning of the array.
         */
        AS3 native function unshift(...args : [T]):uint;


        /**
         * Sorting option that indicates strings are case insensitive.
         */
        public static const CASEINSENSITIVE:uint = 1;

        /**
         * Sorting option that indicates the sort is in descending order.
         */
        public static const DESCENDING:uint = 2;

        /**
         * Sorting option that disables string conversion of
         * sort operands and enables integer conversion of the
         * operands in case they are non-numeric.
         */
        public static const NUMERIC:uint = 16;

        /**
         * Sorting option that indicates to return an array of indices
         * and that the original array is not modified.
         */
        public static const RETURNINDEXEDARRAY:uint = 8;

        /**
         * Sorting option that indicates to check for identical fields
         * against two objects in comparison.
         */
        public static const UNIQUESORT:uint = 4;
    }
}