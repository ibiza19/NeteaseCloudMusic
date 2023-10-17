//
//  NCHttpManager.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/5/23.
//

#import <Foundation/Foundation.h>

#define kHttpManager [NCHttpManager sharedManager]

// API
// 获取歌手歌曲详情，传入音乐id
#define kSongDetail(x) [NSString stringWithFormat:@"song/detail?ids=%@", x]
// 搜索歌曲接口，传入需要搜索的字符串
#define kSearchSong(x) [NSString stringWithFormat:@"search?keywords=%@", x]
// 获取音乐URL接口，传入音乐URL
#define kSongUrl(x) [NSString stringWithFormat:@"song/url/v1?id=%@&level=standard", x]

typedef void(^NCHttpManagerFinishSuccessBlock)(id responseObject);
typedef void(^NCHttpManagerFinishFailureBlock)(NSError *error);

/// 单例，管理http请求相关类
@interface NCHttpManager : NSObject

// 设置单例
+ (instancetype)sharedManager;
+ (id)alloc __attribute__((unavailable("Invalid, use sharedManager instead")));
+ (id)new __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)copy __attribute__((unavailable("Invalid, use sharedManager instead")));
- (id)mutableCopy __attribute__((unavailable("Invalid, use sharedManager instead")));

- (void)get:(NSString *)api
     params:(NSDictionary *)params
successBlock:(NCHttpManagerFinishSuccessBlock)successBlock
failureBlock:(NCHttpManagerFinishFailureBlock)failureBlock;

@end
