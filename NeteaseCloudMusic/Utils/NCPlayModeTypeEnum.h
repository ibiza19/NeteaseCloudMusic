//
//  NCPlayModeTypeEnum.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/21/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NCPlayModeType) {
    KeyBoardTypeDefault = 0,
    KeyBoardTypeNumber,
    KeyBoardTypeEmail
};

@interface NCPlayModeTypeEnum : NSObject

@end

NS_ASSUME_NONNULL_END
