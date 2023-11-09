//
//  NCMusicPlayerManager.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCMusicPlayerManager.h"
#import "NCPlayStatusTypeEnum.h"
#import "NCNotification.h"
#import "NCPlayListManager.h"
#import "NCBlockMacros.h"
#import "NCHttpManager.h"
#import "NCSongDetailInfo.h"


//#define testUrl @"http://m702.music.126.net/20230901223654/467e7a1abf07341ec8d021c2dd52d226/jd-musicrep-ts/fb2d/a0ca/9c09/7e29b01a1d73ed641436588fb8a85674.mp3"

@interface NCMusicPlayerManager ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, assign) NCPlayStatusType playStatusType;

@end

@implementation NCMusicPlayerManager

#pragma mark - Life Cycle

+ (instancetype)sharedManager {
    static NCMusicPlayerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _playStatusType = NCPlayStatusTypePause;
        
        [kNotificationCenter addObserver:self selector:@selector(_handleToPlayMusic) name:NC_TO_PLAY_MUSIC_NOTIFICATION object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handleToPauseMusic) name:NC_TO_PAUSE_MUSIC_NOTIFICATION object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handlePlayMusic:) name:NCPLAYMUSIC_NOTIFICATION object:nil];
        
//        [self _getPlayUrlFromLocal];
//        if (kPlayListManager.playListInfo) {
//            NCSongDetailInfo *songDetailInfo = kPlayListManager.playListInfo[kPlayListManager.index];
//            weakify(self);
//            [kHttpManager get:kSongUrl(@(songDetailInfo.song_id)) params:nil successBlock:^(id  _Nonnull responseObject) {
//                strongify(self);
//                NSString *urlString = (NSString *)responseObject;
//            } failureBlock:^(NSError * _Nonnull error) {
//                NSLog(@"");
//            }];
//        }
//        [self _playMusicWithString:@""];
    }
    return self;
}

#pragma mark - Private Method

- (void)_playMusicWithSongId:(NSNumber *)songId {
    weakify(self);
    [kHttpManager get:kSongUrl(songId) params:nil successBlock:^(id  _Nonnull responseObject) {
        strongify(self);
        NSString *urlString = (NSString *)[([responseObject objectForKey:@"data"][0]) objectForKey:@"url"];
        AVPlayerItem *musicItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:urlString]];
        self.player = [[AVPlayer alloc] initWithPlayerItem:musicItem];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"");
    }];
}


#pragma mark Notification

- (void)_handlePlayMusic:(NSNotification *)notification {
    NCSongDetailInfo *songDetailInfo = notification.object;
    [self _playMusicWithSongId:@(songDetailInfo.song_id)];
}

- (void)_handleToPlayMusic {
    if (!self.player) {
        if (kPlayListManager.playListInfo) {
            NCSongDetailInfo *songDetailInfo = kPlayListManager.playListInfo[kPlayListManager.index];
            [self _playMusicWithSongId:@(songDetailInfo.song_id)];
        }
    }
    if (self.player) {
        [self.player play];
    }
    NSLog(@"");
}

- (void)_handleToPauseMusic {
    [self.player pause];
    NSLog(@"");
}

@end
