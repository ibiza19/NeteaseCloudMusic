//
//  NCMusicDetailViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMusicDetailViewController.h"
#import "NCScreen.h"
#import "NCColor.h"
#import "NCMusicDetailBackgroundImageView.h"
#import "NCMusicDetailTurntableView.h"
#import "NCMusicDetailControlView.h"

@interface NCMusicDetailViewController ()

@property (nonatomic, strong, readwrite) NCMusicDetailBackgroundImageView *backgroundImageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *singerNameLabel;
@property (nonatomic, strong, readwrite) NCMusicDetailTurntableView *turntableView;
@property (nonatomic, strong, readwrite) NCMusicDetailControlView *controlView;

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
        self.backgroundImageView = [[NCMusicDetailBackgroundImageView alloc] initWithFrame:self.view.bounds];
        self.backgroundImageView;
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
    
    [self.view addSubview:({
        self.turntableView = [[NCMusicDetailTurntableView alloc] initWithFrame:CGRectMake(0, self.singerNameLabel.frame.origin.y + self.singerNameLabel.frame.size.height + UI(18), SCREEN_WIDTH, 390)];
        self.turntableView;
    })];
    
    [self.view addSubview:({
        self.controlView = [[NCMusicDetailControlView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - HOMEINDICATOR_HEIGHT - 87, SCREEN_WIDTH, 80)];
        self.controlView;
    })];
}

#pragma mark - Private Method

- (void)_clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
