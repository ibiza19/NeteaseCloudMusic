//
//  NCNotification.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kNotificationCenter [NSNotificationCenter defaultCenter]

// 播放控制
// 播放下一首歌
    // 点击下一首歌
#define NC_CLICK_NEXTSONG_BUTTON @"NCClickNextSongButton"
    // listManager推送下一首歌的通知
#define NC_PLAY_NEXTSONG @"NCPlayNextSong"

// 播放上一首歌
    // 点击上一首歌
#define NC_CLICK_PREVIOUSSONG_BUTTON @"NCClickPreviousSongButton"
    // listManager推送上一首歌的通知
#define NC_PLAY_PREVIOUSSONG @"NCPlayPreviousSong"

// 播放音乐（从暂停到播放）
#define NC_TO_PLAY_MUSIC_NOTIFICATION @"NCToPlayMusicNotification"
// 暂停播放音乐（从播放到暂停）
#define NC_TO_PAUSE_MUSIC_NOTIFICATION @"NCToPauseMusicNotification"



// 播放歌曲，对当前歌曲列表刷新后的播放，不用刷新label
#define NCPLAYMUSIC_NOTIFICATION @"NCPlayMusicNotification"
// 仅刷新label
#define NC_MUSICDETAILVIEW_REFRESHLABEL_NOTIFICATION @"NCMusicDetailViewRefreshLabelNotification"

// 播放模式切换
#define NC_PLAYMODE_TO_REPEAT @"NCPlayModeToRepeat"
#define NC_PLAYMODE_TO_REPEATONE @"NCPlayModeToRepeatOne"
#define NC_PLAYMODE_TO_Shuffle @"NCPlayModeToShuffle"

// 点击mini音乐播放器非按钮部分
#define NCMINIPLAYERVIEW_LET_APPEAR_NOTIFICATION @"NCMiniPlayViewLetAppearNotification"

@interface NCNotification : NSObject

@end

NS_ASSUME_NONNULL_END
