package
{
    [whack_external(slots="2", local="intclass")]
    public final class int
    {
        public native function int(arg:*);

        AS3 native function toExponential(fractionDigits:uint):String;

        AS3 native function toFixed(fractionDigits:uint):String;

        AS3 native function toPrecision(precision:uint):String;

        AS3 native function toString(radix:Number = 10):String;

        AS3 native function valueOf():int;
    }
}