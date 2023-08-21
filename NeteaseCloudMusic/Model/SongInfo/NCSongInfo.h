//
//  NCSongInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>
#import "NCArtistInfo.h"
#import "NCAlbumInfo.h"

NS_ASSUME_NONNULL_BEGIN

/// 简单歌曲信息，用于搜索后这种简单的展示
@interface NCSongInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger song_id;
@property (nonatomic, strong) NCAlbumInfo *album;
@property (nonatomic, strong) NSArray<NCArtistInfo *> *artists;

@end

NS_ASSUME_NONNULL_END
