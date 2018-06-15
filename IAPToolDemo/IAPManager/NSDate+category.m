//
//  NSDate+category.m
//  IAPToolDemo
//
//  Created by Superman on 2018/6/15.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)

+ (NSString *)chindDateFormate:(NSDate *)update{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:update];
    return destDateString;
}
@end
