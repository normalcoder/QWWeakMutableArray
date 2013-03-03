#import <Foundation/Foundation.h>

@interface QWWeakRef : NSProxy

+ (instancetype)weakRef:(id)object;
- (instancetype)initWithObject:(id)object;

@end
