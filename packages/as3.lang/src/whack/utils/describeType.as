package whack.utils
{
    /**
     * Returns certain data of a class or interface, such as metadata,
     * variables and methods.
     *
     * @example
     *
     * Given the following class:
     *
     * ```
     * [M1(k="v", "v2")]
     * class C1
     * {
     *     public static var x:*;
     *     [M1]
     *     public var x:*;
     *     public function get y():* {}
     *     public function set y(v:*):void {}
     *     [M1]
     *     public function m():void {}
     * }
     * ```
     *
     * `describeType()` returns a XML object similiar to the following for the above class:
     *
     * ```xml
     * <class>
     *     <M1><entry key="k" value="v"/><entry key="" value="v2"/></M1>
     *     <static>
     *         <variable namespace="" localName="x"/>
     *     </static>
     *     <instance>
     *         <variable namespace="" localName="x">
     *             <M1/>
     *         </variable>
     *         <variable namespace="" localName="y"/>
     *         <method namespace="" localName="m">
     *             <M1/>
     *         </method>
     *     </instance>
     * </class>
     * ```
     *
     * For an interface, `describeType()` returns a `<interface>` tag containing
     * only metadata.
     *
     * For any parameter other than a `Class` object, `describeType()` returns `null`.
     */
    [Whack::External]
    public native function describeType(val:*):XML;
}