//
//  NCMusicDetailTurntableView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/7/23.
//

#import "NCMusicDetailTurntableView.h"

@interface NCMusicDetailTurntableView ()

@property (nonatomic, strong, readwrite) UIImageView *needleView;
@property (nonatomic, strong, readwrite) UIImageView *albumCoverImageView;

@end

@implementation NCMusicDetailTurntableView

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
            self.needleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"play_needle"]];
            [self.needleView sizeToFit];
            self.needleView.center = CGPointMake(self.frame.size.width / 2 + 24, self.needleView.frame.size.height / 2);
            self.needleView;
        })];
        
        [self addSubview:({
            self.albumCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 192)];
            self.albumCoverImageView.center = CGPointMake(self.frame.size.width / 2, 235);
            self.albumCoverImageView.image = [UIImage imageNamed:@"test"];
            self.albumCoverImageView.layer.cornerRadius = self.albumCoverImageView.bounds.size.width / 2;
            self.albumCoverImageView.layer.masksToBounds = YES;
            self.albumCoverImageView;
        })];
    }
    return self;
}

@end
