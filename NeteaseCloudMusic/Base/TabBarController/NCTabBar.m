//
//  NCTabBar.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCTabBar.h"
#import "NCTabBarItem.h"
#import "NCMiniPlayerView.h"
#import "NCScreen.h"

@implementation NCTabBarItemInfo

@end

@interface NCTabBar () <NCTabBarItemDelegate>

@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;  // 背景图
@property (nonatomic, strong, readwrite) NCMiniPlayerView *miniPlayerView; // mini播放条
@property (nonatomic, strong, readwrite) UIView *itemsContainer; // 装item的容器
@property (nonatomic, copy, readwrite) NSArray<NCTabBarItem *> *tabBarItems;

@end

@implementation NCTabBar

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundImage = [[UIImage alloc] init];
        self.shadowImage = [[UIImage alloc] init];
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
    
    // 将之前的移除
    for (UIView *tempView in self.subviews) {
        if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tempView removeFromSuperview];
        }
    }
    
    CGFloat exHeight = 25.0;
    CGRect frame = self.bounds;
    frame.origin.y = exHeight;
    frame.size.height = self.bounds.size.height - exHeight;
    self.backgroundImageView.frame = frame;
    
//    CGFloat viewW = SCREEN_WIDTH - 40.0;
//    CGFloat viewX = (SCREEN_WIDTH - viewW) / 2.0;
    self.miniPlayerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, MINI_PLAYVIEW_HEIGHT);


    CGFloat layoutY = self.bottomBarStyle == NCTabBarBottomBarStyleMiniPlayViewOnly ? MINI_PLAYVIEW_HEIGHT + HOMEINDICATOR_HEIGHT : MINI_PLAYVIEW_HEIGHT;
    self.itemsContainer.frame = CGRectMake(0, layoutY, SCREEN_WIDTH, TABBAR_HEIGHT);
    
    CGFloat itemW = SCREEN_WIDTH / self.tabBarItems.count;
    for (NSInteger index = 0; index < self.tabBarItems.count; index++) {
        self.tabBarItems[index].frame = CGRectMake(itemW * index, 0, itemW, TABBAR_HEIGHT);
    }
    
//    if (self.bottomBarStyle == NCTabBarBottomBarStyleMiniPlayViewOnly) {
//        self.backgroundImageView.alpha = 0;
//    }
}

#pragma mark - Private Method

- (void)_initSubviews {
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minibar_bg"]];
    [self addSubview:_backgroundImageView];
    [self sendSubviewToBack:_backgroundImageView];
    
    [self addSubview:({
        _miniPlayerView = [[NCMiniPlayerView alloc] init];
        _miniPlayerView;
    })];
    
    [self addSubview:({
        _itemsContainer = [[UIView alloc] init];
        _itemsContainer;
    })];
    
}

#pragma mark - Public Method

- (void)createTabBarItems {
    NSMutableArray *tabBarMutableItems = @[].mutableCopy;
    for (NSInteger index = 0; index < self.itemsInfo.count; index++) {
        NCTabBarItem *tabBarItem = [[NCTabBarItem alloc] init];
        tabBarItem.tag = index;
        [self.itemsContainer addSubview:tabBarItem];
        [tabBarMutableItems addObject:tabBarItem];
        tabBarItem.delegate = self;
    }
    self.tabBarItems = tabBarMutableItems.copy;
}

- (void)reloadData:(NSInteger)selectedIndex {
    self.backgroundImageView.image = self.bgImage;
    
    for (NSInteger index = 0; index < self.tabBarItems.count; index++) {
        NCTabBarItem *item = self.tabBarItems[index];
        NCTabBarItemInfo *info = self.itemsInfo[index];
        item.iconName = info.name;
        item.iconSelectedName = info.selectName;
        item.titleColor = info.color;
        item.titleSelectedColor = info.selectColor;
        item.title = info.title;
    }
    
    [self updateBarItemsWithSelectedIndex:selectedIndex];
}

- (void)updateBarItemsWithSelectedIndex:(NSInteger)selectedIndex {
    for (NSInteger index = 0; index < self.tabBarItems.count; index++) {
        NCTabBarItem *item = self.tabBarItems[index];
        NCTabBarItemState state = (selectedIndex == index) ? NCTabBarItemStateSelected : NCTabBarItemStateNormal;
        [item reloadDataWithState:state];
    }
}

#pragma mark - NCTabBarItemDelegate

- (void)tabBarItem:(NCTabBarItem *)tabBarItem didSelectedIndex:(NSInteger)didSelectedIndex {
    if (self.NCDelegate) {
        [self.NCDelegate tabBar:self didSelectedIndex:didSelectedIndex];
    }
}

@end
