package
{
    import whack.utils.describeType;

    /**
     * Implements type reflection functions that allows inspecting types.
     *
     * @see whack.utils.describeType
     */
    [whack_external(slots="2")]
    public static class Reflect
    {
        /**
         * Detects a type that is instantiated from a parameterized type,
         * returning its composition. Returns `null` if the given
         * `classObject` argument is not an argumentation to a parameterized type;
         * otherwise returns an array of `Class` objects representing the arguments
         * to the parameterized type.
         *
         * This method only detects `Array.<T>`, `Vector.<T>` and
         * `Map.<K, V>` as parameterized types; other parameterized types are erased.
         *
         * To determine the parameterized type of a type argumentation,
         * use one of the following `Reflect` methods:
         *
         * - `Reflect.isArrayType()`
         * - `Reflect.isMapType()`
         * - `Reflect.isVectorType()`
         *
         * @see #isArrayType
         * @see #isMapType
         * @see #isVectorType
         */
        public static native function typeArguments(classObject:Class):[Class];

        /**
         * Indicates whether a type is an instantiation of the `Array.<T>` class.
         */
        public static native function isArrayType(classObject:Class):Boolean;

        /**
         * Indicates whether a type is an instantiation of the `Map.<K, V>` class.
         */
        public static native function isMapType(classObject:Class):Boolean;

        /**
         * Indicates whether a type is an instantiation of the `Vector.<T>` class.
         */
        public static native function isVectorType(classObject:Class):Boolean;
    }
}