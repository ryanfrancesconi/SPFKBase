
#import "ExceptionCatcher.h"

void ExceptionCatcherOperation(void (^_Nonnull tryBlock)(void),
                               void (^_Nullable catchBlock)(NSException *_Nonnull)) {
    @try {
        tryBlock();
    } @catch (NSException *exception)   {
        if (catchBlock) {
            catchBlock(exception);
        }
    }
}
