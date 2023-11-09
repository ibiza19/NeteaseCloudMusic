//
//  NCSongDetailInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import <Foundation/Foundation.h>
#import "NCArtistInfo.h"
#import "NCAlbumInfo.h"

NS_ASSUME_NONNULL_BEGIN

/// 歌曲详细信息
@interface NCSongDetailInfo : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger song_id;
@property (nonatomic, strong) NCAlbumInfo *album;
@property (nonatomic, strong) NSArray<NCArtistInfo *> *artists;

@end

NS_ASSUME_NONNULL_END
