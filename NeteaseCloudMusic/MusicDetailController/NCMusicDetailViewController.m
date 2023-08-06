//
//  NCMusicDetailViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMusicDetailViewController.h"
#import "QMUIKit/QMUIKit.h"
#import "NCScreen.h"
#import "NCColor.h"

@interface NCMusicDetailViewController ()

@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *singerNameLabel;


@end

@implementation NCMusicDetailViewController

#pragma mark - Life Cycle

-(instancetype)init {
    self = [super init];
    if (self) {
        self.currentPushOperation = NCNavigationControllerPushOperationBottomUp;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundImageView.image = [UIImage imageNamed:@"test"];
        self.backgroundImageView;
    })];
    
    [self.view addSubview:({
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect qmui_effectWithBlurRadius:57]];
        visualEffectView.frame = self.view.bounds;
        visualEffectView;
    })];
    
    [self.view addSubview:({
        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, STATUSBAR_HEIGHT, 60, 60)];
        [backButton addTarget:self action:@selector(_clickBackButton) forControlEvents:UIControlEventTouchUpInside];
        [backButton setImage:[UIImage imageNamed:@"Navi_dismiss"] forState:UIControlStateNormal];
        backButton;
    })];
    
    [self.view addSubview:({
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, STATUSBAR_HEIGHT, SCREEN_WIDTH - 160, 40)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"飞机场的10:30";
        self.titleLabel;
    })];
    
    [self.view addSubview:({
        self.singerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, STATUSBAR_HEIGHT + 30, SCREEN_WIDTH - 160, 25)];
        self.singerNameLabel.textAlignment = NSTextAlignmentCenter;
        self.singerNameLabel.font = [UIFont boldSystemFontOfSize:15];
        self.singerNameLabel.textColor = NCColorGray(190);
        self.singerNameLabel.text = @"陶喆";
        self.singerNameLabel;
    })];
}

#pragma mark - Private Methodq

- (void)_clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"");
}

@end
