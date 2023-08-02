//
//  NCNotification.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define kNotificationCenter [NSNotificationCenter defaultCenter]

// 点击mini音乐播放器非按钮部分
#define NCMINIPLAYERVIEW_CLICKED_NOTIFICATION @"NCMiniPlayViewClickedNotification"

@interface NCNotification : NSObject

@end

NS_ASSUME_NONNULL_END
