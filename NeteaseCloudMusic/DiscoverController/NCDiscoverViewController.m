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
#import "NCSongInfo.h"
#import <YYModel/YYModel.h>
#import "NCMusicPlayerManager.h"
#import "NCPlayListManager.h"
#import "NCBlockMacros.h"

@interface NCDiscoverViewController ()

@property (nonatomic, strong) NSArray<NCSongInfo *> *songsInfo;

@end

@implementation NCDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    weakify(self);
    [kHttpManager get:kSearchSong(@"飞机场的10:30") params:nil successBlock:^(id  _Nonnull responseObject) {
        strongify(self);
        NSMutableArray<NCSongInfo *> *songsMutableInfo = @[].mutableCopy;
        for (NSDictionary *dict in responseObject[@"result"][@"songs"]) {
            [songsMutableInfo addObject:[NCSongInfo yy_modelWithDictionary:dict]];
        }
        self.songsInfo = songsMutableInfo.copy;
        [self.view addSubview:({
            UIButton *button = [[UIButton alloc] initWithFrame:UIRectAdapter(100, 100, 100, 100)];
            button.backgroundColor = [UIColor blueColor];
            [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
            button;
        })];
        NSLog(@"");
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

- (void)clickButton {
    [kPlayListManager reloadPlayListWithSongInfo:self.songsInfo Index:0];
}

@end
