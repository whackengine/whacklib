package whack.utils
{
    [whack_external(local="idatainputitrfc")]
    public interface IDataInput
    {
        function get bytesAvailable():uint;

        /**
         * Indicates the byte order used when reading or writing data,
         * as one of the constants of the `Endian` class.
         * 
         * @see Endian
         */
        function get endian():String;
        function set endian(val:String):void;

        /**
         * Reads a signed byte.
         */
        function readByte():int;

        /**
         * Reads multiple bytes.
         */
        function readBytes(length:uint):ByteArray;

        /**
         * Reads a IEEE 754 double-precision floating point.
         */
        function readDouble():Number;

        /**
         * Reads a IEEE 754 single-precision floating point.
         */
        function readFloat():float;

        /**
         * Reads a signed 32-bit integer.
         */
        function readInt():int;

        /**
         * Reads a signed 16-bit integer.
         */
        function readShort():int;

        /**
         * Reads an unsigned byte.
         */
        function readUnsignedByte():uint;

        /**
         * Reads an unsigned 32-bit integer.
         */
        function readUnsignedInt():uint;

        /**
         * Reads an unsigned 16-bit integer.
         */
        function readUnsignedShort():uint;

        /**
         * Reads a UTF-8 string whose size is specified by the `length` parameter.
         */
        function readUTF(length:uint):String;
    }
}