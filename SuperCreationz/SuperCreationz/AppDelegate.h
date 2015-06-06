//
//  AppDelegate.h
//  SuperCreationz
//
//  Created by Cyan on 05/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ICETutorialController.h"

//colors
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBWithAlpha(rgbValue, alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alpha]
#define kLightBlue UIColorFromRGB(0x539cf1)
#define kshareBlue UIColorFromRGB(0x539cf1)
#define kshareRed UIColorFromRGB(0xff3000)
#define kAwesomeColor [UIColor colorWithRed:255/255.0f green:165/255.0f blue:38/255.0f alpha:1.0f]
#define kCreamGray UIColorFromRGB(0xF4F4F4)


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ICETutorialController *viewController;

- (void)introView;


@end

