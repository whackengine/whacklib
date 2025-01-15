package
{
    [whack_external(slots="3", local="dateclass")]
    public final class Date
    {
        public native function Date(yearOrTimevalue:Object = undefined, month:Number = 0, date:Number = 1, hour:Number = 0, minute:Number = 0, second:Number = 0, millisecond:Number = 0);

        /**
         * The day of the month (an integer from 1 to 31) according to local time.
         */
        AS3 native function get date():Number;
        AS3 native function set date(val:Number):void;

        /**
         * The day of the month (an integer from 1 to 31) according to universal time (UTC).
         */
        AS3 native function get dateUTC():Number;
        AS3 native function set dateUTC(val:Number):void;

        /**
         * The day of the week (0 for Sunday, 1 for Monday, and so on) according to local time.
         */
        AS3 native function get day():Number;

        /**
         * The day of the week (0 for Sunday, 1 for Monday, and so on) according to universal time (UTC).
         */
        AS3 native function get dayUTC():Number;

        /**
         * The full year (a four digit number, such as 2000) according to local time.
         */
        AS3 native function get fullYear():Number;
        AS3 native function set fullYear(val:Number):void;

        /**
         * The full year (a four digit number, such as 2000) according to universal time (UTC).
         */
        AS3 native function get fullYearUTC():Number;
        AS3 native function set fullYearUTC(val:Number):void;

        AS3 native function get hours():Number;
        AS3 native function set hours(val:Number):void;

        AS3 native function get hoursUTC():Number;
        AS3 native function set hoursUTC(val:Number):void;

        AS3 native function get milliseconds():Number;
        AS3 native function set milliseconds(val:Number):void;

        AS3 native function get millisecondsUTC():Number;
        AS3 native function set millisecondsUTC(val:Number):void;

        AS3 native function get minutes():Number;
        AS3 native function set minutes(val:Number):void;

        AS3 native function get minutesUTC():Number;
        AS3 native function set minutesUTC(val:Number):void;

        AS3 native function get month():Number;
        AS3 native function set month(val:Number):void;

        AS3 native function get monthUTC():Number;
        AS3 native function set monthUTC(val:Number):void;

        AS3 native function get seconds():Number;
        AS3 native function set seconds(val:Number):void;

        AS3 native function get secondsUTC():Number;
        AS3 native function set secondsUTC(val:Number):void;

        AS3 native function get time():Number;
        AS3 native function set time(val:Number):void;

        AS3 native function get timezoneOffset():Number;

        AS3 native function getDate():Number;

        AS3 native function getDay():Number;

        AS3 native function getFullYear():Number;

        AS3 native function getHours():Number;

        AS3 native function getMilliseconds():Number;

        AS3 native function getMinutes():Number;

        AS3 native function getMonth():Number;

        AS3 native function getSeconds():Number;

        AS3 native function getTime():Number;

        AS3 native function getTimezoneOffset():Number;

        AS3 native function getUTCDate():Number;

        AS3 native function getUTCDay():Number;

        AS3 native function getUTCFullYear():Number;

        AS3 native function getUTCHours():Number;

        AS3 native function getUTCMilliseconds():Number;

        AS3 native function getUTCMinutes():Number;

        AS3 native function getUTCMonth():Number;

        AS3 native function getUTCSeconds():Number;

        AS3 static native function parse(date:String):Number;

        AS3 native function setDate(day:Number):Number;

        AS3 native function setFullYear(year:Number, month:Number, day:Number):Number;

        AS3 native function setHours(hour:Number, minute:Number, second:Number, millisecond:Number):Number;

        AS3 native function setMilliseconds(millisecond:Number):Number;

        AS3 native function setMinutes(minute:Number, second:Number, millisecond:Number):Number;

        AS3 native function setMonth(month:Number, day:Number):Number;

        AS3 native function setSeconds(second:Number, millisecond:Number):Number;

        AS3 native function setTime(millisecond:Number):Number;

        AS3 native function setUTCDate(day:Number):Number;

        AS3 native function setUTCFullYear(year:Number, month:Number, day:Number):Number;

        AS3 native function setUTCHours(hour:Number, minute:Number, second:Number, millisecond:Number):Number;

        AS3 native function setUTCMilliseconds(millisecond:Number):Number;

        AS3 native function setUTCMinutes(minute:Number, second:Number, millisecond:Number):Number;

        AS3 native function setUTCMonth(month:Number, day:Number):Number;

        AS3 native function setUTCSeconds(second:Number, millisecond:Number):Number;

        AS3 native function toDateString():String;

        AS3 native function toLocaleDateString():String;

        AS3 native function toLocaleString():String;

        AS3 native function toLocaleTimeString():String;

        AS3 native function toString():String;

        AS3 native function toTimeString():String;

        AS3 native function toUTCString():String;

        public static native function UTC(year:Number, month:Number, date:Number = 1, hour:Number = 0, minute:Number = 0, second:Number = 0, millisecond:Number = 0):Number;

        AS3 native function valueOf():Number;
    }
}