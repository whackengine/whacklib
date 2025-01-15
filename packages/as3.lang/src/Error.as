package
{
    [whack_external(slots="3", local="errorclass")]
    public dynamic class Error
    {
        public native function Error(message:String = "");

        public native function get message():String;
        public native function set message(val:String):void;

        public native function get name():String;
        public native function set name(val:String):void;

        public native function getStackTrace():String;
    }

    [whack_external(slots="4", local="aggregateerrorclass")]
    public dynamic class AggregateError extends Error
    {
        public native function AggregateError(errors:Object, message:String = "");

        public native function get errors():Object;
        public native function set errors(val:Object):void;
    }

    public dynamic class AssertionError extends Error
    {
        public function AssertionError(message:String = "")
        {
            super(message);
        }
    }

    [whack_external(slots="3", local="argumenterrorclass")]
    public dynamic class ArgumentError extends Error
    {
        public native function ArgumentError(message:String = "");
    }

    [whack_external(slots="3", local="definitionerrorclass")]
    public dynamic class DefinitionError extends Error
    {
        public native function DefinitionError(message:String = "");
    }

    [whack_external(slots="3", local="evalerrorclass")]
    public dynamic class EvalError extends Error
    {
        public native function EvalError(message:String = "");
    }

    [whack_external(slots="3", local="rangeerrorclass")]
    public dynamic class RangeError extends Error
    {
        public native function RangeError(message:String = "");
    }

    [whack_external(slots="3", local="referenceerrorclass")]
    public dynamic class ReferenceError extends Error
    {
        public native function ReferenceError(message:String = "");
    }

    [whack_external(slots="3", local="securityerrorclass")]
    public dynamic class SecurityError extends Error
    {
        public native function SecurityError(message:String = "");
    }

    [whack_external(slots="3", local="syntaxerrorclass")]
    public dynamic class SyntaxError extends Error
    {
        public native function SyntaxError(message:String = "");
    }

    [whack_external(slots="3", local="typeerrorclass")]
    public dynamic class TypeError extends Error
    {
        public native function TypeError(message:String = "");
    }

    [whack_external(slots="3", local="urierrorclass")]
    public dynamic class URIError extends Error
    {
        public native function URIError(message:String = "");
    }

    [whack_external(slots="3", local="verifyerrorclass")]
    public dynamic class VerifyError extends Error
    {
        public native function VerifyError(message:String = "");
    }
}