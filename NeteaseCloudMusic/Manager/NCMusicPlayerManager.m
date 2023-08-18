//
//  NCMusicPlayerManager.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/15/23.
//

#import "NCMusicPlayerManager.h"

#define testUrl @"http://m8.music.126.net/20230815184824/2080d15ed60fffad43196209d4383c8b/ymusic/41c1/5ea9/ff50/42c98c6cac347a7aa7dc2a43c3a21097.mp3"

@interface NCMusicPlayerManager ()

@property (nonatomic, strong) AVPlayer *player;

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
        
    }
    return self;
}

#pragma mark - Private Method

- (void)_playMusicWithString:(NSString *)musicString {
    NSURL *url = [NSURL URLWithString:testUrl];
    AVPlayerItem *musicItem = [[AVPlayerItem alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:musicItem];
    
    [self.player play];
    
}

@end
