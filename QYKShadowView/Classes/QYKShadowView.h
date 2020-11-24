//
//  QYKShadowView.h
//  QYKShadowView
//
//  Created by Sunshine on 2019/1/29.
//  Copyright © 2019 com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, QYKShadowSide) {
    QYKShadowSideTop       = 1 << 0,
    QYKShadowSideBottom    = 1 << 1,
    QYKShadowSideLeft      = 1 << 2,
    QYKShadowSideRight     = 1 << 3,
    QYKShadowSideAllSides  = ~0UL
};

@interface QYKShadowView : UIView

/// 设置四周阴影: shadowRadius:5  shadowColor:[UIColor colorWithWhite:0 alpha:0.3]
- (void)qyk_shadow;

/// 设置垂直方向的阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
- (void)qyk_verticalShadowRadius:(CGFloat)shadowRadius
                     shadowColor:(UIColor *)shadowColor
                    shadowOffset:(CGSize)shadowOffset;

/// 设置水平方向的阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
- (void)qyk_horizontalShadowRadius:(CGFloat)shadowRadius
                       shadowColor:(UIColor *)shadowColor
                      shadowOffset:(CGSize)shadowOffset;

/// 设置阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
/// @param shadowSide 阴影边
- (void)qyk_shadowRadius:(CGFloat)shadowRadius
             shadowColor:(UIColor *)shadowColor
            shadowOffset:(CGSize)shadowOffset
            byShadowSide:(QYKShadowSide)shadowSide;

/// 设置圆角（四周）
/// @param cornerRadius 圆角半径
- (void)qyk_cornerRadius:(CGFloat)cornerRadius;

/// 设置圆角
/// @param cornerRadius 圆角半径
/// @param corners  圆角边
- (void)qyk_cornerRadius:(CGFloat)cornerRadius
       byRoundingCorners:(UIRectCorner)corners;

@end
