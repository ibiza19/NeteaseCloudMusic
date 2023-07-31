//
//  NCTabBarItem.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBarItem.h"
#import "NCScreen.h"

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
    
    CGFloat imgW = 32;
    CGFloat imgH = 27;
    CGFloat imgX = (self.frame.size.width - imgW) / 2;
    CGFloat imgY = 5;
    self.swappableImageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    
    CGFloat titleX = 0;
    CGFloat titleY = CGRectGetMaxY(self.swappableImageView.frame) - 4;
    CGFloat titleW = self.frame.size.width;
    CGFloat titleH = 18;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

#pragma mark - Private Method

- (void)_initSubviews {
    _swappableImageView = [[UIImageView alloc] init];
    [self addSubview:_swappableImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:10];
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
    self.titleLabel.text = self.title;
    if (state == NCTabBarItemStateNormal) {
        self.titleLabel.textColor = self.titleColor;
        self.swappableImageView.image = [UIImage systemImageNamed:self.iconName];
        self.swappableImageView.tintColor = self.titleColor;
    } else if (state == NCTabBarItemStateSelected) {
        self.titleLabel.textColor = self.titleSelectedColor;
        self.swappableImageView.image = [UIImage systemImageNamed:self.iconSelectedName];
        self.swappableImageView.tintColor = self.titleSelectedColor;
    }
}

@end
