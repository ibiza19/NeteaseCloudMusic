//
//  NCMusicDetailBackgroundImageView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/7/23.
//

#import "NCMusicDetailBackgroundImageView.h"
#import "QMUIKit/QMUIKit.h"

@implementation NCMusicDetailBackgroundImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.image = [UIImage imageNamed:@"test"];
        
        [self addSubview:({
            UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect qmui_effectWithBlurRadius:57]];
            visualEffectView.frame = self.bounds;
            visualEffectView;
        })];
    }
    return self;
}

@end
