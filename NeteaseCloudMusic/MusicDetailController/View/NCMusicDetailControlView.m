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
        [kNotificationCenter addObserver:self selector:@selector(_playMusic) name:NC_PLAY_MUSIC_NOTIFICATION object:nil];
        [kNotificationCenter addObserver:self selector:@selector(_pauseMusic) name:NC_PAUSE_MUSIC_NOTIFICATION object:nil];
        
        CGFloat centerY = self.bounds.size.height / 2;

        UIImageSymbolConfiguration *imageSymbolConfig = [UIImageSymbolConfiguration configurationWithWeight:UIImageSymbolWeightThin];
        
        [self addSubview:({
            self.playButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 73, 72)];
            self.playButton.center = CGPointMake(SCREEN_WIDTH / 2, centerY);
            self.playButton.image = [UIImage systemImageNamed:@"play.circle" withConfiguration:imageSymbolConfig];
            self.playButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayButton)];
            [self addGestureRecognizer:tapGesture];
            self.playButton;
        })];
        
        [self addSubview:({
            self.previousSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            self.previousSongButton.center = CGPointMake(SCREEN_WIDTH / 3, centerY);
            self.previousSongButton.image = [UIImage systemImageNamed:@"backward.end.fill" withConfiguration:imageSymbolConfig];
            self.previousSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPreviousSongButton)];
            [self addGestureRecognizer:tapGesture];
            self.previousSongButton;
        })];
        
        [self addSubview:({
            self.nextSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            self.nextSongButton.center = CGPointMake(SCREEN_WIDTH / 3 * 2, centerY);
            self.nextSongButton.image = [UIImage systemImageNamed:@"forward.end.fill" withConfiguration:imageSymbolConfig];
            self.nextSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickNextSongButton)];
            [self addGestureRecognizer:tapGesture];
            self.nextSongButton;
        })];
        
        [self addSubview:({
            self.playModeButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            self.playModeButton.center = CGPointMake(SCREEN_WIDTH / 6, centerY);
            self.playModeButton.image = [UIImage systemImageNamed:@"repeat"];
            self.playModeButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayModeButton)];
            [self addGestureRecognizer:tapGesture];
            self.playModeButton;
        })];
        
        [self addSubview:({
            self.playListButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            self.playListButton.center = CGPointMake(SCREEN_WIDTH / 6 * 5, centerY);
            self.playListButton.image = [UIImage systemImageNamed:@"text.insert"];
            self.playListButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayListButton)];
            [self addGestureRecognizer:tapGesture];
            self.playListButton;
        })];
        
        
    }
    return self;
}

#pragma mark - Private Method

- (void)_playMusic {
    
}

- (void)_pauseMusic {
    
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
