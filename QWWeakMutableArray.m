#import "QWWeakMutableArray.h"
#import "QWWeakRef.h"

@interface QWWeakMutableArray ()

@property (nonatomic, strong) QWWeakMutableArray *array;

@end

@implementation QWWeakMutableArray

+ (instancetype)array {
    return [[QWWeakMutableArray alloc] init];
}

- (instancetype)init {
    self.array = [NSMutableArray array];
    return self;
}

- (NSString *)description {
    return [self.array description];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.array];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.array methodSignatureForSelector:sel];
}

- (void)addObject:(id)anObject {
    [self.array addObject:[QWWeakRef weakRef:anObject]];
}

@end
