package
{
    [whack_external(slots="2", local="objectclass")]
    public dynamic class Object
    {
        /**
         * Assigns properties from specified objects to `target` in order.
         * This method only assigns enumerable properties; for instance, it will not
         * assign fixture properties from classes.
         *
         * @return The `target` object.
         */
        public static native function assign(target:*, ...objects : [*]):*;

        /**
         * Clones the given object.
         *
         * This method clones `Map.<T>`, `Array.<T>`, `Vector.<T>`,
         * and user classes. For user classes, either their `clone()` method is used
         * or they are cloned property by property.
         * Any other value is returned as is.
         */
        public static native function clone(val:*):*;

        /**
         * Clones the given object, as does `Object.clone()`, but invokes
         * no immediate `clone()` method even if the given object defines it.
         */
        public static native function defaultClone(val:*):*;
    }
}