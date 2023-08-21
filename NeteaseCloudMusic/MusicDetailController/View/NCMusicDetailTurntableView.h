//
//  NCMusicDetailTurntableView.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 8/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 音乐详情界面的转盘视图
@interface NCMusicDetailTurntableView : UIView

/// 通过url重新加载图片
/// @param urlString 图片的urlString
- (void)reloadImageWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
