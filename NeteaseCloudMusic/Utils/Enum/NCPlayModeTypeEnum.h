//
//  NCPlayModeTypeEnum.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/21/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NCPlayModeType) {
    NCPlayModeTypeRepeat,       // 列表循环
    NCPlayModeTypeRepeatOne,    // 单曲循环
    NCPlayModeTypeShuffle       // 随机播放
};

/// 播放模式类型
@interface NCPlayModeTypeEnum : NSObject

@end

NS_ASSUME_NONNULL_END
