//
//  NCMusicPlayerManager.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCMusicPlayerManager.h"
#import "NCPlayStatusTypeEnum.h"
#import "NCNotification.h"

#define testUrl @"http://m8.music.126.net/20230815184824/2080d15ed60fffad43196209d4383c8b/ymusic/41c1/5ea9/ff50/42c98c6cac347a7aa7dc2a43c3a21097.mp3"

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
        
        [kNotificationCenter addObserver:self selector:@selector(_handelToPlayMusic) name:NC_TO_PLAY_MUSIC_NOTIFICATION object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_handelToPauseMusic) name:NC_TO_PAUSE_MUSIC_NOTIFICATION object:nil];
        
        [self _getPlayUrlFromLocal];
    }
    return self;
}

#pragma mark - Private Method

- (void)playMusicWithString:(NSString *)musicString {
    NSURL *url = [NSURL URLWithString:testUrl];
    AVPlayerItem *musicItem = [[AVPlayerItem alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:musicItem];
    
    [self.player play];
    
}

- (NSURL *)_getPlayUrlFromLocal {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *playUrlPath = [cachePath stringByAppendingPathComponent:@"NCData/playUrl"];
    
    NSData *readPlayUrlData = [fileManager contentsAtPath:playUrlPath];
    id unarchiveUrl = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSURL class] fromData:readPlayUrlData error:nil];
    return (NSURL *)unarchiveUrl;
}

- (void)archivePlayUrl {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"NCData"];
    NSString *playUrlPath = [cachePath stringByAppendingPathComponent:@"NCData/playUrl"];
    
    // 创建文件夹
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];

    NSData *playUrlData = [NSKeyedArchiver archivedDataWithRootObject:((AVURLAsset *)self.player.currentItem.asset).URL requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:playUrlPath contents:playUrlData attributes:nil];
}

#pragma mark Notification
- (void)_handelToPlayMusic {
    NSLog(@"");
}

- (void)_handelToPauseMusic {
    NSLog(@"");
}

@end
