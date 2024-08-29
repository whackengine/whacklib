package sw.utils
{
    [SkyWhack::External]
    public interface IDataOutput
    {
        /**
         * Indicates the byte order used when reading or writing data,
         * as one of the constants of the `Endian` class.
         * 
         * @see Endian
         */
        function get endian():String;
        function set endian(val:String):void;

        /**
         * Writes a signed byte.
         */
        function writeByte(val:int):void;

        /**
         * Writes multiple bytes.
         */
        function writeBytes(bytes:ByteArray):void;

        /**
         * Writes a IEEE 754 double-precision floating point.
         */
        function writeDouble(val:Number):void;

        /**
         * Writes a IEEE 754 single-precision floating point.
         */
        function writeFloat(val:float):void;

        /**
         * Writes a signed 32-bit integer.
         */
        function writeInt(val:int):void;

        /**
         * Writes a signed 16-bit integer.
         */
        function writeShort(val:int):void;

        /**
         * Writes an unsigned byte.
         */
        function writeUnsignedByte(val:uint):void;

        /**
         * Writes an unsigned 32-bit integer.
         */
        function writeUnsignedInt(val:uint):void;

        /**
         * Writes an unsigned 16-bit integer.
         */
        function writeUnsignedShort(val:uint):void;

        /**
         * Writes a UTF-8 string.
         */
        function writeUTF(str:String):void;
    }
}