//
//  NCBaseViewController.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/29/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, NCNavigationControllerPushOperations) {
    NCNavigationControllerPushOperationNormal,
    NCNavigationControllerPushOperationBottomUp,
};

@interface NCBaseViewController : UIViewController

// 当前viewController是否要延迟做动画
@property (nonatomic, assign, readwrite) BOOL isDelayShowBottomBar;
// 当前viewController使用push的方式
@property (nonatomic, assign, readwrite) NCNavigationControllerPushOperations currentPushOperation;

@end

NS_ASSUME_NONNULL_END
