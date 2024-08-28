package flex.utils
{
    [Flex::External(slots="2")]
    public class Proxy
    {
        flex_proxy native function callProperty(name:*, ...rest : [*]):*;

        flex_proxy native function deleteProperty(name:*):Boolean;

        flex_proxy native function getDescendants(name:*):*;

        flex_proxy native function getProperty(name:*):*;

        flex_proxy native function hasProperty(name:*):Boolean;

        flex_proxy native function nextName(index:int):String;

        flex_proxy native function nextNameIndex(index:int):int;

        flex_proxy native function nextValue(index:int):*;

        flex_proxy native function setProperty(name:*, value:*):void;
    }
}