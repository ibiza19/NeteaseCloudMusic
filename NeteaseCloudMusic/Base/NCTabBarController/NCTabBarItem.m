//
//  NCTabBarItem.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBarItem.h"

@interface NCTabBarItem ()

@property (nonatomic, strong, readwrite) UIImageView *swappableImageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@end


@implementation NCTabBarItem

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubviews];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleClickItem)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imgW = 30;
    CGFloat imgH = 30;
    CGFloat imgX = (CGRectGetWidth(self.frame) - imgW) / 2;
    CGFloat imgY = 0;
    _swappableImageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    CGFloat titleX = 0;
    CGFloat titleY = CGRectGetMaxY(_swappableImageView.frame) + 1;
    CGFloat titleW = CGRectGetWidth(self.frame);
    CGFloat titleH = 18;
    _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

#pragma mark - Private Method

- (void)_initSubviews {
    _swappableImageView = [[UIImageView alloc] init];
    [self addSubview:_swappableImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:10];
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
}

- (void)_handleClickItem {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarItem:didSelectedIndex:)]) {
        [self.delegate tabBarItem:self didSelectedIndex:self.tag];
    }
}

#pragma mark - Public Method

- (void)reloadDataWithState:(NCTabBarItemState)state {
    if (state == NCTabBarItemStateNormal) {
        _titleLabel.textColor = _titleColor;
        _swappableImageView.image = [UIImage imageNamed:_iconName];
    } else if (state == NCTabBarItemStateSelected) {
        _titleLabel.textColor = _titleSelectedColor;
        _swappableImageView.image = [UIImage imageNamed:_iconSelectedName];
    }
}

@end
