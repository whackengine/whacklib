package whack.utils
{
    [whack_external(slots="2", local="proxyclass")]
    public class Proxy
    {
        whack_proxy native function callProperty(name:*, ...rest : [*]):*;

        whack_proxy native function deleteProperty(name:*):Boolean;

        whack_proxy native function getDescendants(name:*):*;

        whack_proxy native function getProperty(name:*):*;

        whack_proxy native function hasProperty(name:*):Boolean;

        whack_proxy native function nextName(index:int):String;

        whack_proxy native function nextNameIndex(index:int):int;

        whack_proxy native function nextValue(index:int):*;

        whack_proxy native function setProperty(name:*, value:*):void;
    }
}