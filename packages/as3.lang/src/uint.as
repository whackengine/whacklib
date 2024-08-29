package
{
    [SkyWhack::External(slots="2")]
    public final class uint
    {
        public native function uint(arg:*);

        AS3 native function toExponential(fractionDigits:uint):String;

        AS3 native function toFixed(fractionDigits:uint):String;

        AS3 native function toPrecision(precision:uint):String;

        AS3 native function toString(radix:Number = 10):String;

        AS3 native function valueOf():uint;
    }
}