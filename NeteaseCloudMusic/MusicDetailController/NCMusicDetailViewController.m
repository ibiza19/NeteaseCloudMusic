//
//  NCMusicDetailViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMusicDetailViewController.h"
#import "QMUIKit/QMUIKit.h"
#import "NCScreen.h"

@interface NCMusicDetailViewController ()

@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;

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
        self.backgroundImageView.image = [UIImage imageNamed:@"test2"];
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
        backButton.alpha = 0.8;
        backButton;
    })];
}

#pragma mark - Private Method

- (void)_clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"");
}

@end
