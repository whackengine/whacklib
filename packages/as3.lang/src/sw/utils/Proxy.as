package whack.utils
{
    [Whack::External(slots="2")]
    public class Proxy
    {
        sw_proxy native function callProperty(name:*, ...rest : [*]):*;

        sw_proxy native function deleteProperty(name:*):Boolean;

        sw_proxy native function getDescendants(name:*):*;

        sw_proxy native function getProperty(name:*):*;

        sw_proxy native function hasProperty(name:*):Boolean;

        sw_proxy native function nextName(index:int):String;

        sw_proxy native function nextNameIndex(index:int):int;

        sw_proxy native function nextValue(index:int):*;

        sw_proxy native function setProperty(name:*, value:*):void;
    }
}