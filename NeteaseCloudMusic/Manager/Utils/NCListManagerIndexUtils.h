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
/// @param realIndex array当前的index
- (void)refreshRepeatWithSize:(NSInteger)size index:(NSInteger)realIndex;

/// 随机播放所需的index
/// @param size array的大小
/// @param realIndex array当前的index
- (void)refreshShuffleWithSize:(NSInteger)size index:(NSInteger)realIndex;

/// 不刷新数组，只刷新index
/// @param realIndex 传入刷新的index
- (void)refreshIndex:(NSInteger)realIndex;

/// 获取之前的index
- (NSInteger)previousIndex;

/// 获取之后的index
- (NSInteger)nextIndex;

@end

NS_ASSUME_NONNULL_END
