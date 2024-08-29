package
{
    [Skywhack::External(slots="3")]
    public final class Number
    {
        public native function Number(arg:*);

        AS3 native function toExponential(fractionDigits:uint):String;

        AS3 native function toFixed(fractionDigits:uint):String;

        AS3 native function toPrecision(precision:uint):String;

        AS3 native function toString(radix:Number = 10):String;

        AS3 native function valueOf():Number;
    }
}