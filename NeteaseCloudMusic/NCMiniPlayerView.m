//
//  NCMiniPlayerView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMiniPlayerView.h"
#import "Utils/NCScreen.h"

@interface NCMiniPlayerView ()

@end

@implementation NCMiniPlayerView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor systemGrayColor];
//        self.layer.cornerRadius = MINI_PLAYVIEW_HEIGHT * 0.5;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
