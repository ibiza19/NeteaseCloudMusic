//
//  NCColor.h
//  NeteaseCloudMusic
//
//  Created by IBIZA on 7/31/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define NCColorRGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define NCColorRGB(r, g, b)     NCColorRGBA(r, g, b, 1.0)
#define NCColorGray(v)          NCColorRGB(v, v, v)

#define NCColorHEX(hexValue, a) NCColorRGBA(((float)((hexValue & 0xFF0000) >> 16)), ((float)((hexValue & 0xFF00) >> 8)), ((float)(hexValue & 0xFF)), a)

#define NCColorRandom           NCColorRGB(arc4random() % 255, arc4random() % 255, arc4random() % 255)

// viewController默认背景色
#define kViewControllerDefaultColor NCColorRGB(244, 249, 252)
// tabBarItem默认颜色
#define kTabBarItemColor NCColorRGB(142, 151, 161)
// tabBarItem选中颜色
#define kTabBarItemSelectColor NCColorRGB(250, 52, 87)
/// 设置view的颜色
@interface NCColor : NSObject

@end

NS_ASSUME_NONNULL_END
