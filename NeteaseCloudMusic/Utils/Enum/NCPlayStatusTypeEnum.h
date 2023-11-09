//
//  NCPlayStatusTypeEnum.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/23/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NCPlayStatusType) {
    NCPlayStatusTypePlay,   // 播放
    NCPlayStatusTypePause   // 暂停

};

/// 播放状态类型
@interface NCPlayStatusTypeEnum : NSObject

@end

NS_ASSUME_NONNULL_END
