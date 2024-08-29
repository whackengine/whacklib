package
{
    [Skywhack::External(slots="4")]
    public final class QName
    {
        public native function QName(arg1:*, arg2:* = undefined);

        public native function get uri():String;
        public native function set uri(val:String):void;

        public native function get localName():String;
        public native function set localName(val:String):void;

        AS3 native function toString():String;
    }
}