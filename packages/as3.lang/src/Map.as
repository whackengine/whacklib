package
{
    /**
     * A collection of key-value pairs.
     * 
     * Accessing a key-value uses the same ActionScript operators as for
     * ActionScript properties; but directly calling a key in a `Map` requires
     * using the `.call(k, ...args)` method.
     * 
     * # Weak keys
     * 
     * When the `Map` is created through weak keys enabled,
     * weak keys must be a managed Object and not for example a primitive.
     * An error is thrown when using a illegal key.
     *
     * In addition, a `Map` with weak keys enabled is not iterable.
     */
    [whack_external(slots="3", local="mapclass")]
    public final class Map.<K, V>
    {
        public native function Map(weakKeys:Boolean = false);

        public native function length():Number;

        /**
         * Indicates whetehr the Map object is weak.
         */
        public native function weak():Boolean;

        public native function apply(key:*, args:Object):*;

        public native function call(key:*, ...args : [*]):*;

        /**
         * Determines whether or not the `Map` includes a key.
         * Equivalent to the `hasOwnProperty()` method.
         */
        public native function has(key:*):Boolean;

        /**
         * Determines whether or not the `Map` includes a key.
         * Equivalent to the `has()` method.
         */
        public native function hasOwnProperty(key:*):Boolean;

        public native function entries() : [[K, V]];

        public native function keys() : [K];

        public native function values() : [V];

        public native function clear():void;
    }
}