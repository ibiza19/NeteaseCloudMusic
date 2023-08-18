//
//  NCMusicDetailViewController.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCBaseViewController.h"

#define kMusicDetailViewController [NCMusicDetailViewController sharedInstance]

NS_ASSUME_NONNULL_BEGIN

/// 点击miniPlayerView进入的详细的音乐播放界面
@interface NCMusicDetailViewController : NCBaseViewController

// 设置单例
+ (instancetype)sharedInstance;
+ (id)alloc __attribute__((unavailable("Invalid, use sharedInstance instead")));
+ (id)new __attribute__((unavailable("Invalid, use sharedInstance instead")));
- (id)copy __attribute__((unavailable("Invalid, use sharedInstance instead")));
- (id)mutableCopy __attribute__((unavailable("Invalid, use sharedInstance instead")));

@end

NS_ASSUME_NONNULL_END
