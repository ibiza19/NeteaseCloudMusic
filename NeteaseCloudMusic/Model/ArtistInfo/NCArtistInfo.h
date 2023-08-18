//
//  NCArtistInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 歌曲中的简单歌手信息，包括id和名字
@interface NCArtistInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger ar_id;

@end

NS_ASSUME_NONNULL_END
