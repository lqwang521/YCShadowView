//
//  QYKShadowView.m
//  QYKShadowView
//
//  Created by Sunshine on 2019/1/29.
//  Copyright © 2019 com. All rights reserved.
//

#import "QYKShadowView.h"

@interface QYKShadowView()
/// 阴影颜色
@property(nonatomic, strong) UIColor        *shadowColor;
/// 阴影偏移
@property(nonatomic, assign) CGSize         shadowOffset;
/// 阴影圆角
@property(nonatomic, assign) CGFloat        shadowRadius;
/// 阴影边
@property(nonatomic, assign) NSInteger      shadowSide;
/// 圆角
@property(nonatomic, assign) CGFloat        cornerRadius;
/// 边角
@property(nonatomic, assign) UIRectCorner   rectCorner;

@property(nonatomic, strong)UIView     *backContentView;

@property(nonatomic, strong)CALayer         *topShadowLayer;
@property(nonatomic, strong)CALayer         *botShadowLayer;
@property(nonatomic, strong)CALayer         *leftShadowLayer;
@property(nonatomic, strong)CALayer         *rightShadowLayer;
@property(nonatomic, strong)CAShapeLayer    *maskLayer;

@end

@implementation QYKShadowView
#pragma mark - init 初始化自身
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}
#pragma mark - Life Cycle 生命周期的方法

#pragma mark - override 重载父类的方法
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.backContentView.layer.backgroundColor = backgroundColor.CGColor;
}

- (void)addSubview:(UIView *)view {
    if (view == _backContentView) {
        [super addSubview:view];
    } else {
        [self.backContentView addSubview:view];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backContentView.frame = self.bounds;
    
    [self setShadowWithShadowRadius:_shadowRadius
                        shadowColor:_shadowColor
                       shadowOffset:_shadowOffset
                       byShadowSide:_shadowSide];
    
    [self setCornerRadius:_cornerRadius byRoundingCorners:_rectCorner];
}

#pragma mark - setupXxx Methods 初始化的方法
- (void)setup {
    [self addSubview:self.backContentView];
}

#pragma mark - public method 共有方法
- (void)qyk_shadow {
    [self qyk_shadowRadius:5
               shadowColor:[UIColor colorWithWhite:0 alpha:0.3]
              shadowOffset:CGSizeMake(0, 0)
              byShadowSide:QYKShadowSideAllSides];
}

/// 设置垂直方向的阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
- (void)qyk_verticalShadowRadius:(CGFloat)shadowRadius
                     shadowColor:(UIColor *)shadowColor
                    shadowOffset:(CGSize)shadowOffset {
    
    [self qyk_shadowRadius:shadowRadius
               shadowColor:shadowColor
              shadowOffset:shadowOffset
              byShadowSide:QYKShadowSideTop|QYKShadowSideBottom];
}

/// 设置水平方向的阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
- (void)qyk_horizontalShadowRadius:(CGFloat)shadowRadius
                       shadowColor:(UIColor *)shadowColor
                      shadowOffset:(CGSize)shadowOffset {
    
    [self qyk_shadowRadius:shadowRadius
               shadowColor:shadowColor
              shadowOffset:shadowOffset
              byShadowSide:QYKShadowSideLeft|QYKShadowSideRight];
}

/// 设置阴影
/// @param shadowRadius 阴影半径
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影边偏移
/// @param shadowSide 阴影边
- (void)qyk_shadowRadius:(CGFloat)shadowRadius
             shadowColor:(UIColor *)shadowColor
            shadowOffset:(CGSize)shadowOffset
            byShadowSide:(QYKShadowSide)shadowSide {
    
    _shadowRadius = shadowRadius;
    _shadowColor  = shadowColor;
    _shadowOffset = shadowOffset;
    _shadowSide   = shadowSide;
}

/// 设置圆角（四周）
/// @param cornerRadius 圆角半径
- (void)qyk_cornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    _rectCorner   = UIRectCornerAllCorners;
}

/// 设置圆角
/// @param cornerRadius 圆角半径
/// @param corners  圆角边
- (void)qyk_cornerRadius:(CGFloat)cornerRadius
       byRoundingCorners:(UIRectCorner)corners {
    _cornerRadius = cornerRadius;
    _rectCorner   = corners;
}

#pragma mark - private method 私有方法
/// 绘制圆角
/// @param cornerRadius 圆角大小
/// @param corners 圆角边
- (void)setCornerRadius:(CGFloat)cornerRadius
      byRoundingCorners:(UIRectCorner)corners {
    
    if (cornerRadius <= 0) {
        return;
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    self.maskLayer.frame = self.bounds;
    self.maskLayer.path = maskPath.CGPath;
    self.backContentView.layer.mask = self.maskLayer;
}

/// 绘制阴影
/// @param shadowRadius 阴影圆角
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowSide 阴影边
- (void)setShadowWithShadowRadius:(CGFloat)shadowRadius
                      shadowColor:(UIColor *)shadowColor
                     shadowOffset:(CGSize)shadowOffset
                     byShadowSide:(QYKShadowSide)shadowSide {
    
    if (shadowRadius <= 0) {
        return;
    }
    
    if (shadowSide & QYKShadowSideTop) {
        [self setSingleSideShadowWithShadowRadius:shadowRadius
                                      shadowColor:shadowColor
                                     shadowOffset:shadowOffset
                                     byShadowSide:QYKShadowSideTop];
    }
    
    if (shadowSide & QYKShadowSideBottom) {
        [self setSingleSideShadowWithShadowRadius:shadowRadius
                                      shadowColor:shadowColor
                                     shadowOffset:shadowOffset
                                     byShadowSide:QYKShadowSideBottom];
    }
    
    if (shadowSide & QYKShadowSideLeft) {
        [self setSingleSideShadowWithShadowRadius:shadowRadius
                                      shadowColor:shadowColor
                                     shadowOffset:shadowOffset
                                     byShadowSide:QYKShadowSideLeft];
    }
    
    if (shadowSide & QYKShadowSideRight) {
        [self setSingleSideShadowWithShadowRadius:shadowRadius
                                      shadowColor:shadowColor
                                     shadowOffset:shadowOffset
                                     byShadowSide:QYKShadowSideRight];
    }
}


/// 绘制单边阴影
/// @param shadowRadius 阴影圆角
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowSide 阴影边
- (void)setSingleSideShadowWithShadowRadius:(CGFloat)shadowRadius
                                shadowColor:(UIColor *)shadowColor
                               shadowOffset:(CGSize)shadowOffset
                               byShadowSide:(QYKShadowSide)shadowSide {
    
    CALayer *shadowLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    if (shadowSide & QYKShadowSideTop) {
        shadowLayer = self.topShadowLayer;
        shadowLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.5);
        [path moveToPoint:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5)];
        [path addLineToPoint:(CGPointMake(0, 0))];
        [path addLineToPoint:(CGPointMake(self.bounds.size.width, 0))];
    } else if (shadowSide & QYKShadowSideLeft) {
        shadowLayer = self.leftShadowLayer;
        shadowLayer.frame = CGRectMake(0, 0, self.frame.size.height*0.5, self.frame.size.height);
        [path moveToPoint:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5)];
        [path addLineToPoint:(CGPointMake(0, 0))];
        [path addLineToPoint:(CGPointMake(0, self.bounds.size.height))];
    } else if (shadowSide & QYKShadowSideRight) {
        shadowLayer = self.rightShadowLayer;
        shadowLayer.frame = CGRectMake(self.frame.size.width*0.5, 0, self.frame.size.width*0.5, self.frame.size.height);
        [path moveToPoint:CGPointMake(0, self.bounds.size.height*0.5)];
        [path addLineToPoint:(CGPointMake(self.frame.size.width*0.5, 0))];
        [path addLineToPoint:(CGPointMake(self.frame.size.width*0.5, self.bounds.size.height))];
    } else if (shadowSide & QYKShadowSideBottom) {
        shadowLayer = self.botShadowLayer;
        shadowLayer.frame = CGRectMake(0, self.frame.size.height*0.5, self.frame.size.width, self.frame.size.height*0.5);
        [path moveToPoint:CGPointMake(self.bounds.size.width*0.5, 0)];
        [path addLineToPoint:(CGPointMake(0, self.bounds.size.height*0.5))];
        [path addLineToPoint:(CGPointMake(self.bounds.size.width, self.bounds.size.height*0.5))];
    }
    
    [self.layer insertSublayer:shadowLayer atIndex:0];
    
    shadowLayer.masksToBounds = NO;
    
    CGFloat components[4];
    [self getRGBAComponents:components forColor:_shadowColor];
    
    shadowLayer.shadowColor   = [UIColor colorWithRed:components[0]
                                                green:components[1]
                                                 blue:components[2]
                                                alpha:1.0].CGColor;
    shadowLayer.shadowOpacity = components[3];
    shadowLayer.shadowRadius  = shadowRadius;
    shadowLayer.shadowOffset  = shadowOffset;
    shadowLayer.shadowPath    = path.CGPath;
}

- (void)getRGBAComponents:(CGFloat [4])components forColor:(UIColor *)color {
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4] = {0};
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaPremultipliedLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    CGFloat a = resultingPixel[3] / 255.0;
    CGFloat unpremultiply = (a != 0.0) ? 1.0 / a / 255.0 : 0.0;
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] * unpremultiply;
    }
    components[3] = a;
}

#pragma mark - Setter/Getter Methods set/get方法
- (UIView *)backContentView {
    if (!_backContentView) {
        _backContentView = [[UIView alloc] init];
        _backContentView.layer.backgroundColor = [UIColor whiteColor].CGColor;
        //        _backContentView.layer.masksToBounds = YES;
        //        _backContentView.clipsToBounds = YES;
        [self insertSubview:_backContentView atIndex:0];
    }
    return _backContentView;
}

- (CALayer *)topShadowLayer {
    if (!_topShadowLayer) {
        _topShadowLayer = [[CALayer alloc] init];
    }
    return _topShadowLayer;
}

- (CALayer *)botShadowLayer {
    if (!_botShadowLayer) {
        _botShadowLayer = [[CALayer alloc] init];
    }
    return _botShadowLayer;
}

- (CALayer *)leftShadowLayer {
    if (!_leftShadowLayer) {
        _leftShadowLayer = [[CALayer alloc] init];
    }
    return _leftShadowLayer;
}

- (CALayer *)rightShadowLayer {
    if (!_rightShadowLayer) {
        _rightShadowLayer = [[CALayer alloc] init];
    }
    return _rightShadowLayer;
}

- (CAShapeLayer *)maskLayer {
    if (!_maskLayer) {
        _maskLayer = [[CAShapeLayer alloc] init];
    }
    return _maskLayer;
}

@end
