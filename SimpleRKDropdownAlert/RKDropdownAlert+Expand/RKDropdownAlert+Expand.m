//
//  RKDropdownAlert+Expand.m
//  gongfubao
//
//  Created by EriceWang on 15/12/10.
//  Copyright © 2015年 Hangzhou Tree Finance Ltd. All rights reserved.
//





@interface UIColor (HEXSTRING)
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
@implementation UIColor (HEXSTRING)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end


#import "RKDropdownAlert+Expand.h"

#define HEXCOLOR(hex)     [UIColor colorWithHexString:hex alpha:1]
@interface PrivateDelegate : NSObject<RKDropdownAlertDelegate>
+ (instancetype)sharedInstance ;
@property (copy, nonatomic) TapClick callback;
@end
@implementation PrivateDelegate
+ (instancetype)sharedInstance {
    static PrivateDelegate *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance =  [[PrivateDelegate alloc] init];
    });
    return instance;
}

-(BOOL)dropdownAlertWasTapped:(RKDropdownAlert*)alert {
    if (self.callback) {
        self.callback(alert);
    }
    return YES;
}
-(BOOL)dropdownAlertWasDismissed {
    return YES;
}
@end

@implementation RKDropdownAlert (Expand)
+ (void)successWithTitle:(NSString *)title message:(NSString *)message withTapClick:(TapClick)callBack{
    if (callBack) {
        [PrivateDelegate sharedInstance].callback = callBack;
    }
    [self title:title message:message backgroundColor:HEXCOLOR(@"6dae18") textColor:nil delegate:[PrivateDelegate sharedInstance]];
    
}
+ (void)warningWithTitle:(NSString *)title message:(NSString *)message withTapClick:(TapClick)callBack{
    if (callBack) {
        [PrivateDelegate sharedInstance].callback = callBack;
    }
    [self title:title message:message backgroundColor:HEXCOLOR(@"ffae00") textColor:nil delegate:[PrivateDelegate sharedInstance]];
    
}
+ (void)errorWithTitle:(NSString *)title message:(NSString *)message withTapClick:(TapClick)callBack {
    if (callBack) {
        [PrivateDelegate sharedInstance].callback = callBack;
    }
    [self title:title message:message backgroundColor:HEXCOLOR(@"e44142") textColor:nil delegate:[PrivateDelegate sharedInstance]];
    
}
+ (void)notificationWithTitle:(NSString *)title message:(NSString *)message withTapClick:(TapClick)callBack{
    if (callBack) {
        [PrivateDelegate sharedInstance].callback = callBack;
    }
    [self title:title message:message backgroundColor:[UIColor redColor] textColor:[UIColor whiteColor] delegate:[PrivateDelegate sharedInstance]];
    
}

@end
