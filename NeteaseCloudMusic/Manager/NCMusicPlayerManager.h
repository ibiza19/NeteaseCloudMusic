//
//  NCMusicPlayerManager.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kMusicPlayerManager [NCMusicPlayerManager sharedManager]

/// 单例，管理音乐播放
@interface NCMusicPlayerManager : NSObject

// 设置单例
+ (instancetype)sharedManager;
+ (id)alloc __attribute__((unavailable("Invalid, use sharedManager instead")));
+ (id)new __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)copy __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)mutableCopy __attribute__((unavailable("Invalid, use sharedManager instead")));
@end

NS_ASSUME_NONNULL_END
