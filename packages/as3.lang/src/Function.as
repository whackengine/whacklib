package
{
    [whack_external(slots="3", local="functionclass")]
    public final class Function
    {
        public native function Function();

        /**
         * Indicates the number of arguments that the function
         * expects.
         */
        public native function get length():Number;

        AS3 native function apply(thisArg:*, args:*):*;

        AS3 native function call(thisArg:*, ...args:[*]):*;
    }
}