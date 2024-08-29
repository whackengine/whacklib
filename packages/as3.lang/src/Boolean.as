package
{
    [SkyWhack::External(slots="3")]
    public final class Boolean
    {
        public native function Boolean(arg:*);

        AS3 native function toString():String;

        AS3 native function valueOf():Boolean;
    }
}