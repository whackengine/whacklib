package
{
    [whack_external(slots="2", local="objectclass")]
    public dynamic class Object
    {
        /**
         * Clones the given object.
         *
         * This method clones `Map.<T>`, `Array.<T>`, `Vector.<T>`,
         * and user classes. For user classes, either their `clone()` method is used
         * or they are cloned property by property.
         * Any other value is returned as is.
         */
        public static native function clone(val:*):*;
    }
}