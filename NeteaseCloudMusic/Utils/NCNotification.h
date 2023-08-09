//
//  NCNotification.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kNotificationCenter [NSNotificationCenter defaultCenter]

// 播放音乐通知
#define NC_PLAY_MUSIC_NOTIFICATION @"NCPlayMusicNotification"
// 暂停播放音乐通知
#define NC_PAUSE_MUSIC_NOTIFICATION @"NCPauseMusicNotification"

// 点击mini音乐播放器非按钮部分
#define NCMINIPLAYERVIEW_CLICKED_NOTIFICATION @"NCMiniPlayViewClickedNotification"

@interface NCNotification : NSObject

@end

NS_ASSUME_NONNULL_END
