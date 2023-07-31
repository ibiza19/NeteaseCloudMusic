//
//  NCDiscoverViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCDiscoverViewController.h"
#import "NCMusicDetailViewController.h"
#import "NCScreen.h"

@interface NCDiscoverViewController ()

@end

@implementation NCDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        UIButton *button = [[UIButton alloc] initWithFrame:UIRectAdapter(100, 100, 100, 100)];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        button;
    })];
}

- (void)clickButton {
    NCMusicDetailViewController *controller = [[NCMusicDetailViewController alloc] init];
    controller.view.backgroundColor = [UIColor systemPinkColor];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
