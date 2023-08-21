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

// 播放控制
// 播放下一首歌
// 播放上一首歌

// 播放歌曲，对当前歌曲列表刷新后的播放，不用刷新label
#define NCPLAYMUSIC_NOTIFICATION @"NCPlayMusicNotification"
// 仅刷新label
#define NC_MUSICDETAILVIEW_REFRESHLABEL_NOTIFICATION @"NCMusicDetailViewRefreshLabelNotification"


// 点击mini音乐播放器非按钮部分
#define NCMINIPLAYERVIEW_LET_APPEAR_NOTIFICATION @"NCMiniPlayViewLetAppearNotification"

@interface NCNotification : NSObject

@end

NS_ASSUME_NONNULL_END
