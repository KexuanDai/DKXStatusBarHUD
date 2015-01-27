//
//  DKXStatusBarHUD.h
//  02-新闻详情页面
//
//  Created by Kevin on 15/1/26.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKXStatusBarHUD : NSObject

/**
 *  显示信息
 *
 *  @param message 信息
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;

/**
 *  显示信息
 *
 *  @param message   信息
 *  @param imageName 图片名称（图片高度最好在20像素以内，仅限于本地图片）
 */
+ (void)showMessage:(NSString *)message imageName:(NSString *)imageName;

/**
 *  显示成功信息
 *
 *  @param message 成功信息
 */
+ (void)showSuccess:(NSString *)message; //NS_DEPRECATED_IOS(2_0, 3_0, "请使用xxxx方法");

/**
 *  显示失败信息
 *
 *  @param message 错误信息
 */
+ (void)showError:(NSString *)message;

/**
 *  显示加载信息
 *
 *  @param message 加载信息
 */
+ (void)showLoading:(NSString *)message;

/**
 *  隐藏加载信息
 */
+ (void)hideLoading;

@end
