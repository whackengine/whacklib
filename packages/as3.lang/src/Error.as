package
{
    [Skywhack::External(slots="3")]
    public dynamic class Error
    {
        public native function Error(message:String = "");

        public native function get message():String;
        public native function set message(val:String):void;

        public native function get name():String;
        public native function set name(val:String):void;

        public native function getStackTrace():String;
    }

    [Skywhack::External(slots="4")]
    public dynamic class AggregateError extends Error
    {
        public native function AggregateError(errors:Object, message:String = "");

        public native function get errors():Object;
        public native function set errors(val:Object):void;
    }

    [Skywhack::External(slots="3")]
    public dynamic class ArgumentError extends Error
    {
        public native function ArgumentError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class DefinitionError extends Error
    {
        public native function DefinitionError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class EvalError extends Error
    {
        public native function EvalError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class RangeError extends Error
    {
        public native function RangeError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class ReferenceError extends Error
    {
        public native function ReferenceError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class SecurityError extends Error
    {
        public native function SecurityError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class SyntaxError extends Error
    {
        public native function SyntaxError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class TypeError extends Error
    {
        public native function TypeError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class URIError extends Error
    {
        public native function URIError(message:String = "");
    }

    [Skywhack::External(slots="3")]
    public dynamic class VerifyError extends Error
    {
        public native function VerifyError(message:String = "");
    }
}