package
{
    [whack_external(slots="3", local="promiseclass")]
    public final class Promise.<T>
    {
        public native function Promise(executor : function(function(T):void, function(*):void):void);

        public static native function all(promiseList:*):Promise.<[T]>;

        /**
         * Waits for all specified promises to settle and returns a Promise that
         * contains the outcome of each of them in a Object record.
         * 
         * The outcome record is in the format \{ status, value, reason \},
         * where status is either `fulfilled` or `rejected`, and `value` is set
         * to the fulfilled value if status is `fulfilled` and `reason` is set
         * to the error value if status is `rejected`.
         */
        public static native function allSettled(promiseList:*):Promise.<[Object]>;

        public static native function any(promiseList:*):Promise.<T>;

        public static native function race(promiseList:*):Promise.<T>;

        public static native function reject(reason:*):Promise.<T>;

        public static native function resolve(value:T):Promise.<T>;

        public native function then(onFulfilled : function(T):*, onRejected : function(*):* = null):*;

        public native function catch(onRejected : function(*):*):*;

        public native function finally(onFinally : function():*):*;
    }
}