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
#import <SDWebImage/UIImageView+WebCache.h>
#import "NCPlayModeTypeEnum.h"
#import "NCListManagerIndexUtils.h"

@interface NCPlayListManager ()

@property (nonatomic, strong) NCListManagerIndexUtils *indexManager;
@property (nonatomic, assign) NCPlayModeType playModeType;

@end

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

- (instancetype)init {
    self = [super init];
    if (self) {
        _playModeType = NCPlayModeTypeRepeat;
#warning 之后加入从文件中读取的逻辑判断
        _index = 0;
        _indexManager = [[NCListManagerIndexUtils alloc] init];
        [_indexManager refreshRepeatWithSize:10];
        
        [kNotificationCenter addObserver:self selector:@selector(_handleClickNextSongButton) name:NC_CLICK_NEXTSONG_BUTTON object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handleClickPreviousSongButton) name:NC_CLICK_PREVIOUSSONG_BUTTON object:nil];
        
        [kNotificationCenter addObserver:self selector:@selector(_handleModeChange:) name:NC_PLAYMODE_TO_REPEAT object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handleModeChange:) name:NC_PLAYMODE_TO_REPEATONE object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handleModeChange:) name:NC_PLAYMODE_TO_Shuffle object:nil];
    }
    return self;
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
        [self _cachePlayListAlbumImage];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
    // 刷新index
    self.index = index;
    if (self.playModeType == NCPlayModeTypeShuffle) {
        [self.indexManager refreshShuffleWithSize:songsInfo.count];
    } else {
        [self.indexManager refreshRepeatWithSize:songsInfo.count];
    }
    // 弹出musicDetailView，发送刷新的通知
    [kNotificationCenter postNotificationName:NC_MUSICDETAILVIEW_REFRESHLABEL_NOTIFICATION object:songsInfo[index]];
    [kNotificationCenter postNotificationName:NCMINIPLAYERVIEW_LET_APPEAR_NOTIFICATION object:nil];
    
}

#pragma mark - Private Method

// 缓存列表图片
- (void)_cachePlayListAlbumImage {
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    for (NCSongDetailInfo *info in self.playListInfo) {
        NSString *imageUrlString = [NSString stringWithFormat:@"%@?param=600y600", info.album.picUrl];
        [manager loadImageWithURL:[NSURL URLWithString:imageUrlString] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            NSLog(@"");
        }];
    }

}

#pragma mark Notification

- (void)_handleClickNextSongButton {
    self.index = [self.indexManager nextIndexWithIndex:self.index];
    [kNotificationCenter postNotificationName:NC_PLAY_NEXTSONG object:self.playListInfo[self.index]];
}

- (void)_handleClickPreviousSongButton {
    self.index = [self.indexManager previousWithIndex:self.index];
    [kNotificationCenter postNotificationName:NC_PLAY_NEXTSONG object:self.playListInfo[self.index]];
}

- (void)_handleModeChange:(NSNotification *)notification {
    NSString *playModeString = notification.name;
    if ([playModeString isEqualToString:NC_PLAYMODE_TO_REPEAT]) {
        self.playModeType = NCPlayModeTypeRepeat;
        [self.indexManager refreshRepeatWithSize:self.playListInfo.count];
    } else if ([playModeString isEqualToString:NC_PLAYMODE_TO_REPEATONE]) {
        self.playModeType = NCPlayModeTypeRepeatOne;
        [self.indexManager refreshRepeatWithSize:self.playListInfo.count];
    } else if ([playModeString isEqualToString:NC_PLAYMODE_TO_Shuffle]) {
        self.playModeType = NCPlayModeTypeShuffle;
        [self.indexManager refreshShuffleWithSize:self.playListInfo.count];
    }

}

@end
