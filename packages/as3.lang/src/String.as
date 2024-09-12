package
{
    [Whack::External(slots="3")]
    public final class String
    {
        public native function String(arg:String);

        public native function get length():int;

        AS3 native function charAt(index:Number):String;

        AS3 native function charCodeAt(index:Number):Number;

        AS3 native function codePointAt(index:Number):Number;

        AS3 native function concat(...args : [*]):String;

        AS3 native function endsWith(other:String):Boolean;

        AS3 native static function fromCharCode(...charCodes : [Number]):String;

        AS3 native static function fromCodePoint(...codePoints : [Number]):String;

        AS3 native function indexOf(val:String, startIndex:Number = 0):int;

        AS3 native function lastIndexOf(val:String, startIndex:Number = 0x7FFFFFFF):int;

        AS3 native function localeCompare(other:String, ...values : [String]):int;

        AS3 native function match(pattern:*):Array;

        AS3 native function replace(pattern:*, repl:Object):String;

        AS3 native function search(pattern:*):int;

        AS3 native function slice(startIndex:Number = 0, endIndex:Number = 0x7FFFFFFF):String;

        AS3 native function split(delimiter:*, limit:Number = 0x7FFFFFFF):[String];

        AS3 native function startsWith(other:String):Boolean;

        AS3 native function substr(startIndex:Number = 0, length:Number = 0x7FFFFFFF):String;

        AS3 native function substring(startIndex:Number = 0, endIndex:Number = 0x7FFFFFFF):String;

        AS3 native function toLocaleLowerCase():String;

        AS3 native function toLocaleUpperCase():String;

        AS3 native function toLowerCase():String;

        AS3 native function toUpperCase():String;

        AS3 native function trim():String;

        AS3 native function trimStart():String;

        AS3 native function trimEnd():String;

        AS3 native function trimLeft():String;

        AS3 native function trimRight():String;
    }
}