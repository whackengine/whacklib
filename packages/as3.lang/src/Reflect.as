package
{
    /**
     * Implements type reflection functions that allows inspecting as well as
     * creating types.
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
         * Returns description of public or URI-namespace instance properties of an object or class.
         * Virtual properties are included in the output if `virtual` is passed `true`.
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
        public static native function properties(object:*, virtual:Boolean = false):[Object];

        /**
         * Returns the type of an instance property from the specified instance or class object, or `null`
         * if it is the `*` type or if the property is not defined.
         *
         * @param propertyName A string or a `QName` object containing an user namespace URI and a local name.
         */
        public static native function propertyType(object:*, propertyName:*):Class;

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
         *
         * This is an alternative to `[T]` or `Array.<T>` expressions.
         */
        public static native function createArrayType(elementType:Class):Class;

        /**
         * Instantiates the `Vector` class with a given element type, returning an instantiated
         * type.
         *
         * This is an alternative to `Vector.<T>` expressions.
         */
        public static native function createVectorType(elementType:Class):Class;

        /**
         * Instantiates the `Map` class with a given element type, returning an instantiated
         * type.
         *
         * This is an alternative to `Map.<K, V>` expressions.
         */
        public static native function createMapType(keyType:Class, valueType:Class):Class;

        /**
         * Creates a tuple type. This serves as an alternative to the `[T1, T2, ...TN]`
         * type expression.
         */
        public static native function createTupleType(elementTypes : [Class]):Class;

        /**
         * Determines whether an object has a method of the specified name.
         * The difference to using the `propertyName in object && object[propertyName] is Function` is
         * that this reflection method accepts a URI qualified name.
         *
         * @param propertyName A string or a `QName` object containing an user namespace URI.
         */
        public static native function hasMethod(object:Object, propertyName:*):Boolean;

        /**
         * Creates a tuple of the specified element types, initialized with the
         * given elements.
         */
        public static native function constructTuple(elementTypes:[Class], elements:[*]):Class;

        /**
         * Alternative to getting the `constructor` property of an object in ActionScript 3.
         *
         * @return The constructor reflected as a `Class` object, or `null` if it is an
         * undefined or null value.
         */
        public static native function getConstructor(object:*):Class;

        /**
         * Returns the fully qualified name of a type.
         */
        public static native function qualifiedName(type:Class):String;

        /**
         * Returns the local name of a type; that is, a name that is not
         * fully qualified.
         */
        public static native function localName(type:Class):String;

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

        /**
         * Indicates whether a given type is a class or not.
         */
        public static native function isClass(type:Class):Boolean;

        /**
         * Indicates whether a class's constructor is optional or not.
         */
        public static native function hasOptionalConstructor(type:Class):Boolean;
    }
}