package flex.utils
{
    /**
     * A collection of key-value pairs.
     * 
     * Accessing a key-value uses the same ActionScript operators as for
     * ActionScript properties; but directly calling a key in a Dictionary requires
     * using the `.call(k, ...args)` method.
     * 
     * # Weak keys
     * 
     * When the Dictionary is created through weak keys enabled,
     * weak keys must be a managed Object and not for example a primitive.
     * An error is thrown when using a illegal key.
     */
    [Flex::External(slots="3")]
    public class Dictionary
    {
        public native function Dictionary(weakKeys:Boolean = false);

        public native function length():Number;

        public native function apply(key:*, args:Object):*;

        public native function call(key:*, ...args : [*]):*;

        public native function has(key:*):Boolean;

        public native function hasOwnProperty(key:*, ...args : [*]):*;

        public native function entries() : [[*, *]];

        public native function keys() : [*];

        public native function values() : [*];

        public native function clear():void;
    }
}