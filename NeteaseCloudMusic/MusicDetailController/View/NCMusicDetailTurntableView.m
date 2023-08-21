//
//  NCMusicDetailTurntableView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/7/23.
//

#import "NCMusicDetailTurntableView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NCMusicDetailTurntableView ()

@property (nonatomic, strong, readwrite) UIImageView *needleView;
@property (nonatomic, strong, readwrite) UIImageView *albumCoverImageView;

@end

@implementation NCMusicDetailTurntableView

#pragma mark - Life Cycle

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 315, 315)];
            backView.backgroundColor = [UIColor whiteColor];
            backView.center = CGPointMake(self.frame.size.width / 2, 235);
            backView.alpha = 0.05;
            backView.layer.cornerRadius = backView.bounds.size.width / 2;
            backView.layer.masksToBounds = YES;
            backView;
        })];
        
        // 添加黑胶唱片圆盘的视图
        [self addSubview:({
            UIImageView *diskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"play_disc"]];
            diskImageView.center = CGPointMake(self.frame.size.width / 2, 235);
            diskImageView;
        })];
        
        [self addSubview:({
            _needleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"play_needle"]];
            [_needleView sizeToFit];
            _needleView.center = CGPointMake(self.frame.size.width / 2 + 24, _needleView.frame.size.height / 2);
            _needleView;
        })];
        
        [self addSubview:({
            _albumCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 192)];
            _albumCoverImageView.center = CGPointMake(self.frame.size.width / 2, 235);
            _albumCoverImageView.image = [UIImage imageNamed:@"test"];
            _albumCoverImageView.layer.cornerRadius = _albumCoverImageView.bounds.size.width / 2;
            _albumCoverImageView.layer.masksToBounds = YES;
            _albumCoverImageView;
        })];
    }
    return self;
}

#pragma mark - Public Method

- (void)reloadImageWithUrlString:(NSString *)urlString {
    NSLog(@"1");
    [self.albumCoverImageView sd_setImageWithURL:[NSURL URLWithString:urlString]
                                placeholderImage:[UIImage imageNamed:@"cm2_default_cover_fm"]];
}

@end
