package
{
    import whack.utils.describeType;

    /**
     * Implements type reflection functions that allows inspecting as well as
     * instantiating types.
     *
     * @see whack.utils.describeType
     */
    [whack_external(slots="2", local="thereflectclass")]
    public static class Reflect
    {
        /**
         * Detects a type that is instantiated from a parameterized type,
         * returning its composition. Returns `null` if the given
         * `type` argument is not an argumentation to a parameterized type;
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
         * @see Reflect.isArrayType
         * @see Reflect.isMapType
         * @see Reflect.isVectorType
         */
        public static native function typeArguments(type:Class):[Class];

        /**
         * Lookups a specific meta-data from a type. Returns `null` if none,
         * or a plain object in the form `{ name, entries: [...] }` where
         * `name` is the given name and `entries` is an array of `[String, String]` tuples.
         * The first element of each tuple may be `null` if the entry is keyless.
         *
         * This method returns an object of the following format:
         *
         * ```as3
         * ({
         *     name: "A",
         *     // entries is [[String, String]]
         *     // Keyless entries have null as the first element
         *     entries: [ ["x", "true"], [null, "hi"] ]
         * })
         * ```
         */
        public static native function lookupMetadata(type:Class, name:String):Object;

        /**
         * Returns all meta-data from a class. Each meta-data is represented
         * by a plain object in the form `{ name, entries: [...] }` where
         * `name` is the meta-data name and `entries` is an array of `[String, String]` tuples.
         * The first element of each tuple may be `null` if the entry is keyless.
         *
         * This method returns objects of the following format:
         *
         * ```as3
         * ({
         *     name: "A",
         *     // entries is [[String, String]]
         *     // Keyless entries have null as the first element
         *     entries: [ ["x", "true"], [null, "hi"] ]
         * })
         * ```
         */
        public static native function metadata(type:Class):[Object];

        /**
         * Returns description of public or URI-namespace instance variables of a class.
         *
         * This method returns arrays of the following format:
         *
         * ```as3
         * [
         *     {
         *         // metadata: [Object]
         *         metadata: [
         *             // entries is [[String, String]]
         *             // Keyless entries have null as the first element
         *             { name: "A", entries: [ ["x", "true"], [null, "hi"] ] }
         *         ],
         *         // Namespace URI or null if the variable is public.
         *         namespace: null,
         *         name: "x",
         *         type: classObject
         *     }
         * ]
         * ```
         */
        public static native function variables(type:Class):[Object];

        /**
         * Returns the element types of a given tuple type, or returns `null`
         * if the given type is not a tuple.
         */
        public static native function tupleTypeElements(type:Class):[Class];

        /**
         * Returns the super type of a given type. If an interface type is given,
         * returns `null`.
         */
        public static native function superType(type:Class):Class;

        /**
         * For any class other than `Object`, returns a list of its subclasses.
         * For `Object` and other non class types returns an empty list.
         */
        public static native function subclasses(type:Class):[Class];

        /**
         * Instantiates the `Array` class with a given element type, returning an instantiated
         * type.
         */
        public static native function arrayOf(elementType:Class):Class;

        /**
         * Instantiates the `Vector` class with a given element type, returning an instantiated
         * type.
         */
        public static native function vectorOf(elementType:Class):Class;

        /**
         * Instantiates the `Map` class with a given element type, returning an instantiated
         * type.
         */
        public static native function mapOf(keyType:Class, valueType:Class):Class;

        /**
         * Creates a tuple of the specified element types, initialized with the
         * given elements.
         */
        public static native function constructTuple(elementTypes:[Class], elements:[*]):Class;

        /**
         * Returns the fully qualified name of a type.
         */
        public static native function typeFullName(type:Class):String;

        /**
         * Returns the local name of a type; that is, a name that is not
         * fully qualified.
         */
        public static native function typeLocalName(type:Class):String;

        /**
         * Indicates whether a type is an instantiation of the `Array.<T>` class.
         */
        public static native function isArrayType(type:Class):Boolean;

        /**
         * Indicates whether a type is an instantiation of the `Map.<K, V>` class.
         */
        public static native function isMapType(type:Class):Boolean;

        /**
         * Indicates whether a type is a tuple.
         */
        public static native function isTupleType(type:Class):Boolean;

        /**
         * Indicates whether a type is an instantiation of the `Vector.<T>` class.
         */
        public static native function isVectorType(type:Class):Boolean;
    }
}