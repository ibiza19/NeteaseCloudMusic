//
//  NCPlayListManager.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>
@class NCSongInfo;
@class NCSongDetailInfo;

NS_ASSUME_NONNULL_BEGIN

#define kPlayListManager [NCPlayListManager sharedManager]

/// 单例，管理播放列表和播放模式
@interface NCPlayListManager : NSObject

// playList所包含的歌曲信息
@property(nonatomic, strong) NSArray<NCSongDetailInfo *> *playListInfo;
// 当前播放歌曲的index
@property(nonatomic, assign) NSInteger index;

// 设置单例
+ (instancetype)sharedManager;
+ (id)alloc __attribute__((unavailable("Invalid, use sharedManager instead")));
+ (id)new __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)copy __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)mutableCopy __attribute__((unavailable("Invalid, use sharedManager instead")));

/// 使用歌曲重加载播放列表
/// @param songsInfo  要更新的歌曲
/// @param index 当前index
- (void)reloadPlayListWithSongInfo:(NSArray<NCSongInfo *> *)songsInfo Index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
