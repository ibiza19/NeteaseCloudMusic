//
//  NCMusicDetailControlView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/8/23.
//

#import "NCMusicDetailControlView.h"
#import "NCNotification.h"
#import "NCScreen.h"
#import "NCPlayModeTypeEnum.h"
#import "NCPlayStatusTypeEnum.h"

@interface NCMusicDetailControlView ()

@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, strong, readwrite) UIImageView *previousSongButton;
@property (nonatomic, strong, readwrite) UIImageView *nextSongButton;
@property (nonatomic, strong, readwrite) UIImageView *playModeButton;
@property (nonatomic, strong, readwrite) UIImageView *playListButton;
@property (nonatomic, assign, readwrite) NCPlayModeType playModeType;
@property (nonatomic, assign, readwrite) NCPlayStatusType playStatusType;


@end

@implementation NCMusicDetailControlView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat centerY = frame.size.height / 2;

        UIImageSymbolConfiguration *imageSymbolConfig = [UIImageSymbolConfiguration configurationWithWeight:UIImageSymbolWeightThin];
        
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 73, 72)];
            _playButton.center = CGPointMake(SCREEN_WIDTH / 2, centerY);
            _playButton.image = [UIImage systemImageNamed:@"play.circle" withConfiguration:imageSymbolConfig];
            _playButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayButton)];
            [_playButton addGestureRecognizer:tapGesture];
            _playButton.userInteractionEnabled = YES;
            _playStatusType = NCPlayStatusTypePause;
            _playButton;
        })];
        
        [self addSubview:({
            _previousSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            _previousSongButton.center = CGPointMake(SCREEN_WIDTH / 3, centerY);
            _previousSongButton.image = [UIImage systemImageNamed:@"backward.end.fill" withConfiguration:imageSymbolConfig];
            _previousSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPreviousSongButton)];
            [_previousSongButton addGestureRecognizer:tapGesture];
            _previousSongButton.userInteractionEnabled = YES;
            _previousSongButton;
        })];
        
        [self addSubview:({
            _nextSongButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 29, 28)];
            _nextSongButton.center = CGPointMake(SCREEN_WIDTH / 3 * 2, centerY);
            _nextSongButton.image = [UIImage systemImageNamed:@"forward.end.fill" withConfiguration:imageSymbolConfig];
            _nextSongButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickNextSongButton)];
            [_nextSongButton addGestureRecognizer:tapGesture];
            _nextSongButton.userInteractionEnabled = YES;
            _nextSongButton;
        })];
        
        [self addSubview:({
            _playModeButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            _playModeButton.center = CGPointMake(SCREEN_WIDTH / 6, centerY);
            _playModeButton.image = [UIImage systemImageNamed:@"repeat"];
            _playModeType = NCPlayModeTypeRepeat;
            _playModeButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayModeButton)];
            [_playModeButton addGestureRecognizer:tapGesture];
            _playModeButton.backgroundColor = [UIColor redColor];
            _playModeButton.userInteractionEnabled = YES;
            _playModeButton;
        })];
        
        [self addSubview:({
            _playListButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 31, 28)];
            _playListButton.center = CGPointMake(SCREEN_WIDTH / 6 * 5, centerY);
            _playListButton.image = [UIImage systemImageNamed:@"text.insert"];
            _playListButton.tintColor = [UIColor whiteColor];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickPlayListButton)];
            [_playListButton addGestureRecognizer:tapGesture];
            _playListButton.userInteractionEnabled = YES;
            _playListButton;
        })];
        
    }
    return self;
}

#pragma mark - Private Method

- (void)_clickPlayButton {
    if (self.playStatusType == NCPlayStatusTypePlay) {
        self.playButton.image = [UIImage systemImageNamed:@"play.circle" withConfiguration:[UIImageSymbolConfiguration configurationWithWeight:UIImageSymbolWeightThin]];
        self.playStatusType = NCPlayStatusTypePause;
        [kNotificationCenter postNotificationName:NC_TO_PAUSE_MUSIC_NOTIFICATION object:nil];
    } else if (self.playStatusType == NCPlayStatusTypePause) {
        self.playButton.image = [UIImage systemImageNamed:@"pause.circle" withConfiguration:[UIImageSymbolConfiguration configurationWithWeight:UIImageSymbolWeightThin]];
        self.playStatusType = NCPlayStatusTypePlay;
        [kNotificationCenter postNotificationName:NC_TO_PLAY_MUSIC_NOTIFICATION object:nil];
    }
}

- (void)_clickPreviousSongButton {
    [kNotificationCenter postNotificationName:NC_CLICK_PREVIOUSSONG_BUTTON object:nil];
}

- (void)_clickNextSongButton {
    [kNotificationCenter postNotificationName:NC_CLICK_NEXTSONG_BUTTON object:nil];
}

- (void)_clickPlayModeButton {
    switch (self.playModeType) {
        case NCPlayModeTypeRepeat:
            self.playModeButton.image = [UIImage systemImageNamed:@"repeat.1"];
            self.playModeType = NCPlayModeTypeRepeatOne;
            [kNotificationCenter postNotificationName:NC_PLAYMODE_TO_REPEATONE object:nil];
            break;
        case NCPlayModeTypeRepeatOne:
            self.playModeButton.image = [UIImage systemImageNamed:@"shuffle"];
            self.playModeType = NCPlayModeTypeShuffle;
            [kNotificationCenter postNotificationName:NC_PLAYMODE_TO_Shuffle object:nil];
            break;
        case NCPlayModeTypeShuffle:
            self.playModeButton.image = [UIImage systemImageNamed:@"repeat"];
            self.playModeType = NCPlayModeTypeRepeat;
            [kNotificationCenter postNotificationName:NC_PLAYMODE_TO_REPEAT object:nil];
            break;
    }
}

- (void)_clickPlayListButton {
    
}


@end
