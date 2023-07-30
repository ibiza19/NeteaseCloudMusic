//
//  NCTabBar.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBar.h"
//#import "NCTabBarItem.h"
#import "NCScreen.h"
#import "NCMiniPlayerView.h"

@interface NCTabBar ()

@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;  // 背景图
@property (nonatomic, strong, readwrite) UIView *miniPlayerView; // mini播放条
@property (nonatomic, strong, readwrite) UIView *itemsContainer; // 装item的容器
//@property (nonatomic, strong, readwrite) NSArray<NCTabBarItem *> *tabBarItems;

@end

@implementation NCTabBar

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor clearColor];
//        self.backgroundImage = [[UIImage alloc] init];
//        self.shadowImage = [[UIImage alloc] init];
        [self _initSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self _initSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    for (UIView *tempView in self.subviews) {
//        if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tempView removeFromSuperview];
//        }
//    }
    
//    CGFloat exHeight = 25.0;
//    CGRect frame = self.bounds;
//    frame.origin.y = exHeight;
//    frame.size.height = self.bounds.size.height - exHeight;
//    _bgImgView.frame = frame;
    
    CGFloat viewW = SCREEN_WIDTH - 40.0;
    CGFloat viewX = (SCREEN_WIDTH - viewW) / 2.0;
    _miniPlayerView.frame = CGRectMake(viewX, 0.0, viewW, MINI_PLAYVIEW_HEIGHT);
//    self.items
//    self.items
    for (UITabBarItem *item in self.items) {
//        item
        item.imageInsets = UIEdgeInsetsMake(20, 0, -20, 0);
    }
//    CGFloat layoutY = self.bottomBarStyle == NCTabBarBottomBarStyleMiniPlayViewOnly ? MINI_PLAYVIEW_HEIGHT + HOMEINDICATOR_HEIGHT : MINI_PLAYVIEW_HEIGHT;
//    _itemsContainer.frame = CGRectMake(0.0, layoutY, [UIScreen mainScreen].bounds.size.width, tabBarHeight);
//    CGFloat itemW = [UIScreen mainScreen].bounds.size.width / self.tabBarItems.count;
//    for (NSInteger index = 0; index < self.tabBarItems.count; index++) {
//        self.tabBarItems[index].frame = CGRectMake(itemW * index, 0.0, itemW, tabBarHeight);
//    }
}

#pragma mark - Private Method

- (void)_initSubviews {
//    _backgroundImageView = UIImag
    
    [self addSubview:({
        _miniPlayerView = [[NCMiniPlayerView alloc] init];
        _miniPlayerView;
    })];
}


@end
