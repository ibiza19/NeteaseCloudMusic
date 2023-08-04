//
//  NCMusicDetailViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMusicDetailViewController.h"
#import "QMUIKit/QMUIKit.h"

@interface NCMusicDetailViewController ()

@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;

@end

@implementation NCMusicDetailViewController

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
}

@end
