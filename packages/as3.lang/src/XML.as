package
{
    [SW::External(slots="3")]
    public final class XML
    {
        public native function XML(val:*);

        AS3 native function appendChild(child:Object):XML;

        AS3 native function attribute(attributeName:*):XMLList;

        AS3 native function attributes():XMLList;

        AS3 native function child(propertyName:Object):XMLList;

        AS3 native function childIndex():int;

        AS3 native function children():XMLList;

        AS3 native function comments():XMLList;

        AS3 native function contains(value:XML):Boolean;

        /**
         * Returns a copy of the entire node tree including grandchildren.
         */
        AS3 native function copy():XML;

        AS3 native function descendants(name:Object = "*"):XMLList;

        AS3 native function elements(name:Object = "*"):XMLList;

        AS3 native function hasComplexContent():Boolean;

        AS3 native function hasOwnProperty(p:String):Boolean;

        AS3 native function hasSimpleContent():Boolean;

        /**
         * Inserts the given `child2` parameter after the `child1` parameter in this
         * XML object and returns the resulting object.
         */
        AS3 native function insertChildAfter(child1:Object, child2:Object):*;

        /**
         * Inserts the given `child2` parameter before the `child1` parameter in this
         * XML object and returns the resulting object.
         */
        AS3 native function insertChildBefore(child1:Object, child2:Object):*;

        /**
         * For XML objects, this method always returns the integer 1.
         */
        AS3 native function length():int;

        AS3 native function localName():Object;

        /**
         * Gives the qualified name for the XML object.
         */
        AS3 native function name():Object;

        AS3 native function namespace(prefix:String = null):*;

        /**
         * Specifies the type of node:
         * `text`, `comment`, `processing-instruction`, `attribute`, or `element`.
         */
        AS3 native function nodeKind():String;

        AS3 native function normalize():XML;

        AS3 native function parent():*;

        AS3 native function prependChild(child:Object):XML;

        AS3 native function processingInstructions(name:String = "*"):XMLList;

        AS3 native function replace(propertyName:Object, value:XML):XML;

        AS3 native function setChildren(value:Object):XML;

        AS3 native function text():XML;

        AS3 native function toJSON(k:String):*;

        AS3 native function toString():String;

        AS3 native function toXMLString():String;
    }
}