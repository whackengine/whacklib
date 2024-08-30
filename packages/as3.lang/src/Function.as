package
{
    [Whack::External(slots="3")]
    public final class Function
    {
        public native function Function();

        AS3 native function apply(thisArg:*, args:*):*;

        AS3 native function call(thisArg:*, ...args:[*]):*;
    }
}