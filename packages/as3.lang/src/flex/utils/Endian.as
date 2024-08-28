package flex.utils
{
    /**
     * Defines constants that define the byte order used when
     * reading or writing data in a file stream, byte stream, or byte array.
     */
    public final class Endian
    {
        public static const BIG_ENDIAN:String = "bigEndian";
        public static const LITTLE_ENDIAN:String = "littleEndian";

        public function Endian()
        {
            throw new Error("Cannot construct an Endian object.");
        }
    }
}