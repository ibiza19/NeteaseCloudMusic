//
//  NCMusicDetailControlView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/8/23.
//

#import "NCMusicDetailControlView.h"
#import "NCNotification.h"
#import "NCScreen.h"

@interface NCMusicDetailControlView ()

@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, strong, readwrite) UIImageView *previousSongButton;
@property (nonatomic, strong, readwrite) UIImageView *nextSongButton;
@property (nonatomic, strong, readwrite) UIImageView *playModeButton;
@property (nonatomic, strong, readwrite) UIImageView *playListButton;


@end

@implementation NCMusicDetailControlView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
#warning 在controller里面实现相关通知逻辑
//        [kNotificationCenter addObserver:self selector:@selector(_handlePlayMusic) name:NC_PLAY_MUSIC_NOTIFICATION object:nil];
//        [kNotificationCenter addObserver:self selector:@selector(_handlePauseMusic) name:NC_PAUSE_MUSIC_NOTIFICATION object:nil];
        
        CGFloat centerY = frame.size.height / 2;

        UIImageSymbolConfiguration *imageSymbolConfig = [UIImageSymbolConfiguration configurationWithWeight:UIImageSymbolWeightThin];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 73, 72)];
            _playButton.center = CGPointMake(SCREEN_WIDTH / 2, centerY);
            _playButton.image = [UIImage systemImageNamed:@"play.circle" withConfiguration:imageSymbolConfig];
            _playButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayButton)];
            [self addGestureRecognizer:tapGesture];
            _playButton;
        })];
        
        [self addSubview:({
            _previousSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            _previousSongButton.center = CGPointMake(SCREEN_WIDTH / 3, centerY);
            _previousSongButton.image = [UIImage systemImageNamed:@"backward.end.fill" withConfiguration:imageSymbolConfig];
            _previousSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPreviousSongButton)];
            [self addGestureRecognizer:tapGesture];
            _previousSongButton;
        })];
        
        [self addSubview:({
            _nextSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            _nextSongButton.center = CGPointMake(SCREEN_WIDTH / 3 * 2, centerY);
            _nextSongButton.image = [UIImage systemImageNamed:@"forward.end.fill" withConfiguration:imageSymbolConfig];
            _nextSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickNextSongButton)];
            [self addGestureRecognizer:tapGesture];
            _nextSongButton;
        })];
        
        [self addSubview:({
            _playModeButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            _playModeButton.center = CGPointMake(SCREEN_WIDTH / 6, centerY);
            _playModeButton.image = [UIImage systemImageNamed:@"repeat"];
            _playModeButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayModeButton)];
            [self addGestureRecognizer:tapGesture];
            _playModeButton;
        })];
        
        [self addSubview:({
            _playListButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            _playListButton.center = CGPointMake(SCREEN_WIDTH / 6 * 5, centerY);
            _playListButton.image = [UIImage systemImageNamed:@"text.insert"];
            _playListButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayListButton)];
            [self addGestureRecognizer:tapGesture];
            _playListButton;
        })];
        
    }
    return self;
}

#pragma mark - Private Method

// 开始播放音乐
- (void)_handlePlayMusic {
    
}

// 暂停播放音乐
- (void)_handlePauseMusic {
    
}

- (void)_clickPlayButton {
    
}

- (void)_clickPreviousSongButton {
    
}

- (void)_clickNextSongButton {
    
}

- (void)_clickPlayModeButton {
    
}

- (void)_clickPlayListButton {
    
}


@end
