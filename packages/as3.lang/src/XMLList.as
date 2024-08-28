package
{
    [Flex::External(slots="3")]
    public final class XMLList
    {
        public native function XMLList(val:*);

        AS3 native function attribute(attributeName:*):XMLList;

        AS3 native function attributes():XMLList;

        AS3 native function child(propertyName:Object):XMLList;

        AS3 native function children():XMLList;

        AS3 native function comments():XMLList;

        AS3 native function contains(value:XML):Boolean;

        /**
         * Returns a copy of the entire node tree including grandchildren.
         */
        AS3 native function copy():XMLList;

        AS3 native function descendants(name:Object = "*"):XMLList;

        AS3 native function elements(name:Object = "*"):XMLList;

        AS3 native function hasComplexContent():Boolean;

        AS3 native function hasOwnProperty(p:String):Boolean;

        AS3 native function hasSimpleContent():Boolean;

        /**
         * Returns the number of properties in the XMLList object.
         */
        AS3 native function length():int;

        AS3 native function normalize():XMLList;

        AS3 native function parent():Object;

        AS3 native function processingInstructions(name:String = "*"):XMLList;

        AS3 native function text():XMLList;

        AS3 native function toString():String;

        AS3 native function toXMLString():String;
    }
}