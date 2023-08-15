//
//  NCSongDetailInfo.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

/// 歌曲详细信息中的单个歌手信息
@interface NCSongDetailArInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger ar_id;

@end

/// 歌曲详细信息
@interface NCSongDetailInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *al_name;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, assign) NSInteger song_id;
@property (nonatomic, assign) NSInteger al_id;
@property (nonatomic, strong) NSArray<NCSongDetailArInfo *> *ar;

@end

NS_ASSUME_NONNULL_END
