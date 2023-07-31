//
//  NCMiniPlayerView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMiniPlayerView.h"
#import "NCScreen.h"

@interface NCMiniPlayerView ()

@end

@implementation NCMiniPlayerView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
