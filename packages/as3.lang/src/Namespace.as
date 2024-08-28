package
{
    [Flex::External(slots="4")]
    public final class Namespace
    {
        public native function Namespace(arg1:*, arg2:* = undefined);

        public native function get prefix():String;
        public native function set prefix(val:String):void;

        public native function get uri():String;
        public native function set uri(val:String):void;

        AS3 native function toString():String;
    }
}