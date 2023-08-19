//
//  NCPlayListManager.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/18/23.
//

#import "NCPlayListManager.h"
#import "NCSongInfo.h"
#import "NCSongDetailInfo.h"
#import "NCHttpManager.h"
#import "YYModel/YYModel.h"
#import "NCNotification.h"
#import "NCBlockMacros.h"

@implementation NCPlayListManager

#pragma mark - Life Cycle

+ (instancetype)sharedManager {
    static NCPlayListManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}

#pragma mark - Public Method

- (void)reloadPlayListWithSongInfo:(NSArray<NCSongInfo *> *)songsInfo Index:(NSInteger)index {
    // 加载歌曲信息
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (int i = 0; i < songsInfo.count - 1; i++) {
        [mutableString appendFormat:@"%ld,", songsInfo[i].song_id];
    }
    [mutableString appendFormat:@"%ld", songsInfo[songsInfo.count - 1].song_id];
    weakify(self);
    [kHttpManager get:kSongDetail(mutableString.copy) params:nil successBlock:^(id  _Nonnull responseObject) {
        strongify(self);
        NSMutableArray<NCSongDetailInfo *> *songsMutableInfo = @[].mutableCopy;
        for (NSDictionary *dict in responseObject[@"songs"]) {
            [songsMutableInfo addObject:[NCSongDetailInfo yy_modelWithDictionary:dict]];
        }
        self.playListInfo = songsMutableInfo.copy;
        [kNotificationCenter postNotificationName:NCPLAYMUSIC_NOTIFICATION object:self.playListInfo[index]];
        NSLog(@"<<<< 1111");
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
    // 弹出musicDetailView，发送刷新的通知
    self.index = index;
    [kNotificationCenter postNotificationName:NC_MUSICDETAILVIEW_REFRESHLABEL_NOTIFICATION object:songsInfo[index]];
    [kNotificationCenter postNotificationName:NCMINIPLAYERVIEW_LET_APPEAR_NOTIFICATION object:nil];
}

@end
