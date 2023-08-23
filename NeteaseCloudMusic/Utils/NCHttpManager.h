//
//  NCHttpManager.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kHttpManager [NCHttpManager sharedManager]

typedef void(^NCHttpManagerFinishSuccessBlock)(id responseObject);
typedef void(^NCHttpManagerFinishFailureBlock)(NSError *error);

/// 单例，管理http请求相关类
@interface NCHttpManager : NSObject

// 设置单例
+ (instancetype)sharedManager;
+ (id)alloc __attribute__((unavailable("Invalid, use sharedManager instead")));
+ (id)new __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)copy __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)mutableCopy __attribute__((unavailable("Invalid, use sharedManager instead")));



@end

NS_ASSUME_NONNULL_END
