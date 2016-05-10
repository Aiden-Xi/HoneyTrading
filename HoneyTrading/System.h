//
//  System.h
//  HoneyTrading
//
//  Created by xxy on 16/5/9.
//  Copyright © 2016年 MrXi. All rights reserved.
//

#ifndef System_h
#define System_h

#pragma mark - Debug -

#ifdef DEBUG

#define XXYLog(fmt, ...)   NSLog((@"\n%s [Line %u]:\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define XXYLog(fmt, ...)

#endif

#pragma mark - Library -

#import "IQKeyboardManager.h"
#import "MJExtension.h"
#import "FMDB.h"
#import "JKDBHelper.h"
#import "JKDBModel.h"
#import "HoneyModel.h"
#import "HoneyCell.h"

#pragma mark - Category - 

#import "NSString+Tools.h"
#import "NSDictionary+safeObjectForKey.h"

#pragma mark - ViewControllers -

#import "AppDelegate.h"

#pragma mark - Category -


#pragma mark - 三方库配置


#pragma mark - 系统基础设置 -

#define kAppVersion                         [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
#define kAppBuild                           [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]

#define kDeviceOSVersion                    [[[UIDevice currentDevice] systemVersion] floatValue]

#define kIsiPhone                           [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

#define kCustomNaviHeight                   (kDeviceOSVersion >= 7.0 ? 64 : 0)
#define kNavTabBarHeight                    64

#define kPadding_5                          5
#define kPadding_10                         10
#define kPadding_15                         15
#define kPadding_20                         20

#define kNullToString(str)                  ([str isEqual:[NSNull null]] || str == nil) ? @"" : str
#define kNullToArray(arr)                   ([arr isEqual:[NSNull null]] || arr == nil) ? @[] : arr
#define kNullToDictionary(dic)              ([dic isEqual:[NSNull null]] || dic == nil) ? @{} : dic

#define kScreenBounds                       ([[UIScreen mainScreen] bounds])
#define kScreenWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight                       ([[UIScreen mainScreen] bounds].size.height)
#define kScreenSize                         CGSizeMake(kScreenWidth, kScreenHeight)
#define kLineHeight                         (1 / [UIScreen mainScreen].scale)

#define kDefaultColor                       COLOR(17, 17, 17, 1)
#define kDefaultWhiteColor                  COLOR(255, 255, 255, 1)
#define kDefaultBlackColor                  COLOR(0, 0, 0, 1)
#define kBackgroundColor                    COLOR(248, 248, 248, 1)

#define COLOR(r, g, b, a)                   [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:(a * 1.0)]

#define ColorFromRGB(rgbValue)              [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ColorWithAlphaFromRGB(rgbValue,a)              [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a];

#define kFontFamily                         @"Bauhaus ITC"
#define kFontBold                           @"Bauhaus ITC-Bold"

#define kFontSizeFamily(sizeFont)           [UIFont fontWithName:kFontFamily size:sizeFont]
#define kFontSizeFamilyBold(sizeFont)        [UIFont fontWithName:kFontBold size:sizeFont]

#pragma mark - 系统原生单例和StoryBoard -

#define kApplication                        [UIApplication sharedApplication]
#define kAppDelegate                        (AppDelegate *)[UIApplication sharedApplication].delegate
#define kUserDefaults                       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter                 [NSNotificationCenter defaultCenter]

#define kStoryBoard(name)                   (UIStoryboard *)[UIStoryboard storyboardWithName:name bundle:nil]

#endif /* System_h */
