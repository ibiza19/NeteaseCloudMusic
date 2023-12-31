//
//  NCAlbumInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 歌曲中专辑信息
@interface NCAlbumInfo : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, assign) NSInteger al_id;

@end

NS_ASSUME_NONNULL_END
