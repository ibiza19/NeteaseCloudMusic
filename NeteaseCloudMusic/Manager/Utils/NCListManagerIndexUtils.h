//
//  NCListManagerIndexUtils.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/21/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 为PlayListManager提供index，包含shuffle的实现
@interface NCListManagerIndexUtils : NSObject

/// 顺序播放所需的index
/// @param size array的大小
- (void)refreshRepeatWithSize:(NSInteger)size;

/// 随机播放所需的index
/// @param size array的大小
- (void)refreshShuffleWithSize:(NSInteger)size;

/// 返回这个index之前的index
/// @param realIndex array当前的index
- (NSInteger)previousWithIndex:(NSInteger)realIndex;

/// 返回这个index之后的index
/// @param realIndex array当前的index
- (NSInteger)nextIndexWithIndex:(NSInteger)realIndex;

@end

NS_ASSUME_NONNULL_END
