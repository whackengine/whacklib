package
{
    public function assert(test:Boolean, message:String = "", errorClass:Class = null):void
    {
        if (!test)
        {
            throw new (errorClass ?? AssertionError)(message || "Assertion failed.");
        }
    }

    public function assertEquals(left:*, right:*, message:String = "", errorClass:Class = null):void
    {
        if (left !== right)
        {
            throw new (errorClass ?? AssertionError)(message || "Assertion failed: " + String(left) + " !== " + String(right));
        }
    }
}