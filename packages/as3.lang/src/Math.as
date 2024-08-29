package
{
    import sw.externals.js.*;

    public final class Math
    {
        private static const m_ns:* = sw.externals.js.lex("Math");

        public static const E:Number = 2.71828182845905;
        public static const LN10:Number = 2.302585092994046;
        public static const LN2:Number = 0.6931471805599453;
        public static const LOG10E:Number = 0.4342944819032518;
        public static const LOG2E:Number = 1.442695040888963387;
        public static const PI:Number = 3.141592653589793;
        public static const PI:Number = 3.141592653589793;
        public static const SQRT1_2:Number = 0.7071067811865476;
        public static const SQRT2:Number = 1.4142135623730951;

        public function Math()
        {
            throw new Error("Cannot construct a Math object.");
        }

        public static function abs(val:Number):Number
        {
            return m_ns.abs(val);
        }

        public static function acos(val:Number):Number
        {
            return m_ns.acos(val);
        }

        public static function acosh(val:Number):Number
        {
            return m_ns.acosh(val);
        }

        public static function asin(val:Number):Number
        {
            return m_ns.asin(val);
        }

        public static function asinh(val:Number):Number
        {
            return m_ns.asinh(val);
        }

        public static function atan(val:Number):Number
        {
            return m_ns.atan(val);
        }

        public static function atan2(y:Number, x:Number):Number
        {
            return m_ns.atan2(y, x);
        }

        public static function atanh(val:Number):Number
        {
            return m_ns.atanh(val);
        }

        public static function cbrt(val:Number):Number
        {
            return m_ns.cbrt(val);
        }

        public static function ceil(val:Number):Number
        {
            return m_ns.ceil(val);
        }

        public static function cos(angleRadians:Number):Number
        {
            return m_ns.cos(angleRadians);
        }

        public static function cosh(val:Number):Number
        {
            return m_ns.cosh(val);
        }

        public static function exp(val:Number):Number
        {
            return m_ns.exp(val);
        }

        public static function expm1(val:Number):Number
        {
            return m_ns.expm1(val);
        }

        /**
         * Returns the largest integer less than or equal to the input.
         */
        public static function floor(val:Number):Number
        {
            return m_ns.floor(val);
        }

        public static function log(val:Number):Number
        {
            return m_ns.log(val);
        }

        public static function max(val1:Number, val2:Number, ...rest : [Number]):Number
        {
            if (rest.length !== 0)
            {
                rest.unshift(val1, val2);
                return m_ns.max.apply(undefined, as3arraytojsarray(rest));
            }
            return m_ns.max(val1, val2);
        }

        public static function min(val1:Number, val2:Number, ...rest : [Number]):Number
        {
            if (rest.length !== 0)
            {
                rest.unshift(val1, val2);
                return m_ns.min.apply(undefined, as3arraytojsarray(rest));
            }
            return m_ns.min(val1, val2);
        }

        public static function pow(base:Number, pow:Number):Number
        {
            return m_ns.pow(base, pow);
        }

        public static function random():Number
        {
            return m_ns.random();
        }

        public static function round(val:Number):Number
        {
            return m_ns.round(val);
        }

        public static function sin(angleRadians:Number):Number
        {
            return m_ns.sin(angleRadians);
        }

        public static function sqrt(val:Number):Number
        {
            return m_ns.sqrt(val);
        }

        public static function tan(angleRadians:Number):Number
        {
            return m_ns.tan(angleRadians);
        }
    }
}