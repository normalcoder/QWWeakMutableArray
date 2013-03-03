#import "QWWeakRef.h"
#import <objc/runtime.h>

@interface QWWeakRef ()

@property (nonatomic, weak) id weakRef;

@end

@implementation QWWeakRef

+ (instancetype)weakRef:(id)object {
    return [[[self class] alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id)object {
    self.weakRef = object;
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %@>", [self class], [self.weakRef description]];
}

- (id)defaultImplementation {
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if (self.weakRef != nil) {
        [invocation invokeWithTarget:self.weakRef];
    } else {
        invocation.selector = @selector(defaultImplementation);
        [invocation invoke];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (self.weakRef != nil) {
        return [self.weakRef methodSignatureForSelector:sel];
    } else {
        Method method = class_getInstanceMethod([self class], @selector(defaultImplementation));
        return [NSMethodSignature signatureWithObjCTypes:method_getTypeEncoding(method)];
    }
}

@end
