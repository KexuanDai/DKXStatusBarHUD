//
//  DKXStatusBarHUD.m
//  02-新闻详情页面
//
//  Created by Kevin on 15/1/26.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

/**
 *  窗口的高度
 */
#define DKXWindowHeight 20
/**
 *  动画的执行时间
 */
#define DKXDuration 0.5
/**
 *  窗口的停留时间
 */
#define DKXDelay 1.0
/**
 *  文字字体
 */
#define DKXFont [UIFont systemFontOfSize:12]

#import "DKXStatusBarHUD.h"

@implementation DKXStatusBarHUD

/**
 *  全局变量
 */
static const UIWindow *_window;

/**
 *  显示信息
 *
 *  @param message 信息
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image {
    // 避免重复提示
    if (_window) { return; }
    
    // 创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 按钮文字大小
    button.titleLabel.font = DKXFont;
    // 左边内间距设为10
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    // 设置文字
    [button setTitle:message forState:UIControlStateNormal];
    // 设置图片
    [button setImage:image forState:UIControlStateNormal];
    
    // 创建窗口
    _window = [[UIWindow alloc] init];
    // 窗口背景
    _window.backgroundColor = [UIColor blackColor];
    // 设置优先级 UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, -DKXWindowHeight, [UIScreen mainScreen].bounds.size.width          , DKXWindowHeight);
    button.frame = _window.bounds;
    [_window addSubview:button];
    // 显示窗口
    _window.hidden = NO;
    
    // 动画
    [UIView animateWithDuration:DKXDuration animations:^{
        
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        // 可设置持续时间的动画
        [UIView animateWithDuration:DKXDuration delay:DKXDelay options:kNilOptions animations:^{
            
            CGRect frame = _window.frame;
            frame.origin.y = -DKXWindowHeight;
            _window.frame = frame;
        } completion:^(BOOL finished) {
            
            _window = nil;
        }];
    }];
}

/**
 *  显示信息
 *
 *  @param message   信息
 *  @param imageName 图片名称（图片高度最好在20像素以内，仅限于本地图片）
 */
+ (void)showMessage:(NSString *)message imageName:(NSString *)imageName {
    [self showMessage:message image:[UIImage imageNamed:imageName]];
}

/**
 *  显示成功信息
 *
 *  @param message 成功信息
 */
+ (void)showSuccess:(NSString *)message {
    [self showMessage:message imageName:@"DKXStatusBarHUD.bundle/success"];
}

/**
 *  显示失败信息
 *
 *  @param message 错误信息
 */
+ (void)showError:(NSString *)message {
    [self showMessage:message imageName:@"DKXStatusBarHUD.bundle/error"];
}

/**
 *  显示加载信息
 *
 *  @param message 加载信息
 */
+ (void)showLoading:(NSString *)message {
    // 避免重复提示
    if (_window) { return; }
    
    // 创建窗口
    _window = [[UIWindow alloc] init];
    // 窗口背景
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, - DKXWindowHeight, [UIScreen mainScreen].bounds.size.width, DKXWindowHeight);
    _window.hidden = NO;
    
    // 设置文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = _window.bounds;
    label.font = DKXFont;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [_window addSubview:label];
    
    // 网络圈圈
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    // 圈圈执行动画
    [indicatorView startAnimating];
    indicatorView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.width / 4, DKXWindowHeight, DKXWindowHeight);
    [_window addSubview:indicatorView];
    
    // 动画
    [UIView animateWithDuration:DKXDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    }];
}

/**
 *  隐藏加载信息
 */
+ (void)hideLoading {
    [UIView animateWithDuration:DKXDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = - DKXWindowHeight;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        _window = nil;
    }];
}

@end
