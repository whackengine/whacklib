package
{
    [whack_external(slots="3", local="regexpclass")]
    public dynamic class RegExp
    {
        public native function RegExp(re:String, flags:String);

        public native function get dotall():Boolean;

        public native function get global():Boolean;

        public native function get ignoreCase():Boolean;

        public native function get lastIndex():Number;
        public native function set lastIndex(val:Number):void;

        public native function get multiline():Boolean;

        public native function get source():String;

        public native function exec(str:String):[*];

        public native function test(str:String):Boolean;
    }
}