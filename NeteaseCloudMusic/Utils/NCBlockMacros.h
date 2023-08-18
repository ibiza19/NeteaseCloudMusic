//
//  NCBlockMacros.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define weakify(var) __weak typeof(var) NCWeak_##var = var;

#define strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = NCWeak_##var; \
_Pragma("clang diagnostic pop")

/// 定义block的宏
@interface NCBlockMacros : NSObject

@end

NS_ASSUME_NONNULL_END
