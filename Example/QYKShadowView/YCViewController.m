//
//  YCViewController.m
//  QYKShadowView
//
//  Created by yotrolz on 01/30/2019.
//  Copyright (c) 2019 yotrolz. All rights reserved.
//

#import "YCViewController.h"

#import <QYKShadowView/QYKShadowView.h>
#import <Masonry/Masonry.h>

@interface YCViewController ()

@end

@implementation YCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:scroll];
    
    /// 圆角 + 阴影
    QYKShadowView *v1 = [[QYKShadowView alloc] initWithFrame:CGRectZero];
    v1.backgroundColor = [UIColor whiteColor];
    [v1 qyk_shadow];
    [v1 qyk_cornerRadius:10];
    UILabel *label1 = [[UILabel alloc] initWithFrame:v1.bounds];
    label1.text = @"四周阴影\n四周圆角";
    label1.numberOfLines = 2;
    label1.textColor = [UIColor darkGrayColor];
    label1.font = [UIFont systemFontOfSize:13];
    label1.textAlignment = NSTextAlignmentCenter;
    [v1 addSubview:label1];
    [scroll addSubview:v1];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scroll.mas_left).offset(50);
        make.top.equalTo(scroll.mas_top).offset(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v1);
    }];
    
    /// 单个圆角 + 阴影
    QYKShadowView *v2 = [[QYKShadowView alloc] initWithFrame:CGRectZero];
    v2.backgroundColor = [UIColor whiteColor];
    [v2 qyk_shadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(QYKShadowSideAllSides)];
    [v2 qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerTopLeft)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:v2.bounds];
    label2.text = @"四周阴影\n单个圆角";
    label2.numberOfLines = 2;
    label2.textColor = [UIColor darkGrayColor];
    label2.font = [UIFont systemFontOfSize:13];
    label2.textAlignment = NSTextAlignmentCenter;
    [v2 addSubview:label2];
    [scroll addSubview:v2];
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scroll.mas_left).offset(200);
        make.top.equalTo(scroll.mas_top).offset(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v2);
    }];
    
    /// 上下阴影 + 单个圆角
    QYKShadowView *v3 = [[QYKShadowView alloc] initWithFrame:CGRectZero];
    v3.backgroundColor = [UIColor whiteColor];
    [v3 qyk_verticalShadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeZero];
    [v3 qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerTopRight)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:v2.bounds];
    label3.text = @"上下阴影\n单个圆角";
    label3.numberOfLines = 2;
    label3.textColor = [UIColor darkGrayColor];
    label3.font = [UIFont systemFontOfSize:13];
    label3.textAlignment = NSTextAlignmentCenter;
    [v3 addSubview:label3];
    [scroll addSubview:v3];
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scroll.mas_left).offset(50);
        make.top.equalTo(scroll.mas_top).offset(250);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v3);
    }];
    
    /// 单边阴影 + 单个圆角
    QYKShadowView *v4 = [[QYKShadowView alloc] initWithFrame:CGRectZero];
    v4.backgroundColor = [UIColor whiteColor];
    [v4 qyk_shadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(QYKShadowSideRight)];
    [v4 qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerBottomLeft)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:v2.bounds];
    label4.text = @"单边阴影\n单个圆角";
    label4.numberOfLines = 2;
    label4.textColor = [UIColor darkGrayColor];
    label4.font = [UIFont systemFontOfSize:13];
    label4.textAlignment = NSTextAlignmentCenter;
    [v4 addSubview:label4];
    [scroll addSubview:v4];
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scroll.mas_left).offset(200);
        make.top.equalTo(scroll.mas_top).offset(250);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v4);
    }];
    
    /// 上边阴影 + 上边圆角
    QYKShadowView *v5 = [[QYKShadowView alloc] initWithFrame:CGRectZero];
    v5.backgroundColor = [UIColor whiteColor];
    [v5 qyk_shadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(QYKShadowSideTop)];
    [v5 qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)];
    UILabel *label5 = [[UILabel alloc] initWithFrame:v2.bounds];
    label5.text = @"上边阴影\n上边圆角";
    label5.numberOfLines = 2;
    label5.textColor = [UIColor darkGrayColor];
    label5.font = [UIFont systemFontOfSize:13];
    label5.textAlignment = NSTextAlignmentCenter;
    [v5 addSubview:label5];
    [scroll addSubview:v5];
    [v5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scroll.mas_left).offset(50);
        make.top.equalTo(scroll.mas_top).offset(400);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v5);
    }];
    
    /// 下边阴影 + 下边圆角
    QYKShadowView *v6 = [[QYKShadowView alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
    v6.backgroundColor = [UIColor whiteColor];
    [v6 qyk_shadowRadius:10 shadowColor:[UIColor colorWithWhite:0 alpha:0.5] shadowOffset:CGSizeMake(0, 0) byShadowSide:(QYKShadowSideBottom)];
    [v6 qyk_cornerRadius:10 byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)];
    UILabel *label6 = [[UILabel alloc] initWithFrame:v6.bounds];
    label6.text = @"下边阴影\n下边圆角";
    label6.numberOfLines = 2;
    label6.textColor = [UIColor darkGrayColor];
    label6.font = [UIFont systemFontOfSize:13];
    label6.textAlignment = NSTextAlignmentCenter;
    [v6 addSubview:label6];
    [scroll addSubview:v6];
    
    //CGFloat h = v6.frame.origin.y + 200 < self.view.bounds.size.height ? self.view.bounds.size.height+1 : v6.frame.origin.y + 200;
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width, 500);
    
}

@end
