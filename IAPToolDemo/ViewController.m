//
//  ViewController.m
//  IAPToolDemo
//
//  Created by Superman on 2018/6/15.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
static NSString * const productId = @"com.good.test.0001";

@interface ViewController ()<SIApRequestResultsDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [SIAPManager shared].delegate = self;

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [btn setTitle:@"购买" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

#pragma mark 购买行为
- (void)payClick {
    [[SIAPManager shared] requestProductWithId:productId];
}

#pragma mark IApRequestResultsDelegate
- (void)filedWithErrorCode:(NSInteger)errorCode andError:(NSString *)error {
    
    switch (errorCode) {
        case IAP_FILEDCOED_APPLECODE:
            NSLog(@"用户禁止应用内付费购买:%@",error);
            break;
            
        case IAP_FILEDCOED_NORIGHT:
            NSLog(@"用户禁止应用内付费购买");
            break;
            
        case IAP_FILEDCOED_EMPTYGOODS:
            NSLog(@"商品为空");
            break;
            
        case IAP_FILEDCOED_CANNOTGETINFORMATION:
            NSLog(@"无法获取产品信息，请重试");
            break;
            
        case IAP_FILEDCOED_BUYFILED:
            NSLog(@"购买失败，请重试");
            break;
            
        case IAP_FILEDCOED_USERCANCEL:
            NSLog(@"用户取消交易");
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
