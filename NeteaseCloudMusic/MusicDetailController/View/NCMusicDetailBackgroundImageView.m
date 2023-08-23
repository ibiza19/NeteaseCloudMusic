//
//  NCMusicDetailBackgroundImageView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/7/23.
//

#import "NCMusicDetailBackgroundImageView.h"
#import "QMUIKit/QMUIKit.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NCMusicDetailBackgroundImageView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation NCMusicDetailBackgroundImageView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            _backgroundImageView = [[UIImageView alloc] initWithFrame:frame];
            _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
            _backgroundImageView.backgroundColor = [UIColor systemGrayColor];
            _backgroundImageView;
        })];
        
        
        [self addSubview:({
            UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect qmui_effectWithBlurRadius:57]];
            visualEffectView.frame = self.bounds;
            visualEffectView;
        })];
    }
    return self;
}

#pragma mark - Public Method

- (void)reloadImageWithUrlString:(NSString *)urlString {
    [UIView transitionWithView:self.backgroundImageView duration:0.6 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    } completion:nil];
}

@end
