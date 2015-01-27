//
//  ViewController.m
//  DKXStatusBarHUDDemo
//
//  Created by Kevin on 15/1/27.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "DKXStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  提示成功
 */
- (IBAction)showSuccess:(id)sender {
    [DKXStatusBarHUD showSuccess:@"下载成功！"];
}

/**
 *  提示失败
 */
- (IBAction)showError:(id)sender {
    [DKXStatusBarHUD showError:@"下载失败！"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
