//
//  NCDiscoverViewController.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/24/23.
//

#import "NCDiscoverViewController.h"
#import "NCMusicDetailViewController.h"
#import "NCScreen.h"
#import "NCHttpManager.h"
#import "NCSongDetailInfo.h"
#import <YYModel/YYModel.h>
#import "NCMusicPlayerManager.h"

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
    NCBaseViewController *controller = [[NCBaseViewController alloc] init];
    controller.view.backgroundColor = [UIColor systemPinkColor];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:controller animated:YES];
    
    [kHttpManager get:kSongDetail(@"109083") params:nil successBlock:^(id  _Nonnull responseObject) {
        NCSongDetailInfo *info = [NCSongDetailInfo yy_modelWithDictionary:responseObject[@"songs"][0]];
//        [kMusicPlayerManager _playMusicWithString:@"1"];
        NSLog(@"");
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

@end
