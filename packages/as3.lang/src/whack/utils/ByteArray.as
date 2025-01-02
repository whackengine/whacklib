package whack.utils
{
    [whack_external(slots="3")]
    public class ByteArray implements IDataInput, IDataOutput
    {
        public native function ByteArray();

        public static native function zeroes(length:uint):ByteArray;

        JSBridgeFrom static native function arrayBuffer(arg:*):ByteArray;

        JSBridgeFrom static native function byteArray(arg:*):ByteArray;

        /**
         * Returns the underlying `ArrayBuffer` JavaScript object used by the byte array.
         */
        JSBridgeTo native function arrayBuffer():*;

        /**
         * Converts the byte array into a Node.js buffer.
         */
        JSBridgeTo native function buffer():*;

        public native function clone():ByteArray;

        public native function clear():void;

        public native function equals(other:ByteArray):Boolean;

        public native final function get length():uint;
        public native final function set length(val:uint):void;

        public native final function get position():uint;
        public native final function set position(val:uint):void;

        /**
         * @inheritDoc
         */
        public native function get bytesAvailable():uint;

        /**
         * @inheritDoc
         */
        public native function get endian():String;
        public native function set endian(val:String):void;

        public native function readByte():int;

        public native function readBytes(length:uint):ByteArray;

        public native function readDouble():Number;

        public native function readFloat():float;

        public native function readInt():int;

        public native function readShort():int;

        public native function readUnsignedByte():uint;

        public native function readUnsignedInt():uint;

        public native function readUnsignedShort():uint;

        public native function readUTF(length:uint):String;


        public native function writeByte(val:int):void;

        public native function writeBytes(bytes:ByteArray):void;

        public native function writeDouble(val:Number):void;

        public native function writeFloat(val:float):void;

        public native function writeInt(val:int):void;

        public native function writeShort(val:int):void;

        public native function writeUnsignedByte(val:uint):void;

        public native function writeUnsignedInt(val:uint):void;

        public native function writeUnsignedShort(val:uint):void;

        public native function writeUTF(str:String):void;
    }
}
