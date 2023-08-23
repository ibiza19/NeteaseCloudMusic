//
//  NCMiniPlayerView.m
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/30/23.
//

#import "NCMiniPlayerView.h"
#import "NCScreen.h"
#import "NCNotification.h"

@interface NCMiniPlayerView ()

@end

@implementation NCMiniPlayerView

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        
        [self addGestureRecognizer:({
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickView)];
            tapGesture;
        })];
    }
    return self;
}

#pragma mark - Private Method

- (void)_clickView {
    [kNotificationCenter postNotificationName:NCMINIPLAYERVIEW_CLICKED_NOTIFICATION object:nil];
}

@end
