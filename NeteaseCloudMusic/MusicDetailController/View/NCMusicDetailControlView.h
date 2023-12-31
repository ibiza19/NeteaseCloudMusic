//
//  NCMusicDetailControlView.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/8/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 音乐播放器下方5个控制按钮
@interface NCMusicDetailControlView : UIView

/// 刷新播放状态到play
- (void)refreshToPlay;

/// 刷新播放状态到pause
- (void)refreshToPause;

@end

NS_ASSUME_NONNULL_END
