//
//  NCMusicDetailProgressView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/9/23.
//

#import "NCMusicDetailProgressView.h"
#import "NCScreen.h"
#import "NCColor.h"

@interface NCMusicDetailProgressView ()

@property (nonatomic, strong, readwrite) UILabel *leftLabel;
@property (nonatomic, strong, readwrite) UILabel *rightfLabel;
@property (nonatomic, strong, readwrite) UISlider *slider;

@end

@implementation NCMusicDetailProgressView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat centerY = frame.size.height / 2;
        
        [self addSubview:({
            _leftLabel = [[UILabel alloc] init];
            _leftLabel.text = @"00:00";
            _leftLabel.font = [UIFont systemFontOfSize:11];
            _leftLabel.textColor = [UIColor whiteColor];
            _leftLabel.alpha = 0.5;
            [_leftLabel sizeToFit];
            _leftLabel.center = CGPointMake(UI(40), centerY);
            _leftLabel;
        })];
        
        [self addSubview:({
            _rightfLabel = [[UILabel alloc] init];
            _rightfLabel.text = @"04:40";
            _rightfLabel.font = [UIFont systemFontOfSize:11];
            _rightfLabel.textColor = [UIColor whiteColor];
            _rightfLabel.alpha = 0.5;
            [_rightfLabel sizeToFit];
            _rightfLabel.center = CGPointMake(SCREEN_WIDTH - UI(40), centerY);
            _rightfLabel;
        })];
        
        [self addSubview:({
            _slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, _rightfLabel.frame.origin.x - _leftLabel.frame.origin.x - _leftLabel.frame.size.width - UI(18), 10)];
            _slider.center = CGPointMake(frame.size.width / 2, centerY);
            _slider.minimumTrackTintColor = NCColorRGBA(255, 255, 255, 0.6);
            _slider.maximumTrackTintColor = NCColorRGBA(255, 255, 255, 0.1);
            _slider.layer.cornerRadius = 2;
            _slider.layer.masksToBounds = YES;

            [self.slider setThumbImage:[UIImage imageNamed:@"circle_fill"] forState:UIControlStateNormal];
            [self.slider setThumbImage:[UIImage imageNamed:@"circle_fill"] forState:UIControlStateHighlighted];
            
            _slider;
        })];
    }
    return self;
}


@end
