//
//  AppDelegate.m
//  SuperCreationz
//
//  Created by Cyan on 05/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import "AppDelegate.h"
#import "SuperIntroViewController.h"
@interface AppDelegate () <ICETutorialControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      [self introView];
    [self facebookLoginCheck];
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];

 
    //return YES;
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   
    [self facebookLoginCheck];
    [FBSDKAppEvents activateApp];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)facebookLoginCheck {
    NSString *tokenValue = [[FBSDKAccessToken currentAccessToken] tokenString];
    if ([tokenValue length] == 0)
    {
        NSLog(@"Allow user to login ");
    }
    else
    {

        SuperIntroViewController*SuperLogin=[[SuperIntroViewController alloc]init];
        UINavigationController*navigation=[[UINavigationController alloc]initWithRootViewController:SuperLogin];
        [self.window setRootViewController:navigation];
        [self.window makeKeyAndVisible];
        NSLog(@"User is Already logged ");
    }
    
}

- (void)introView {
    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithTitle:@"Dressing is way of life"
                                                            subTitle:@" "
                                                         pictureName:@"splash_22.jpg"
                                                            duration:13.0];
    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithTitle:@" Fashion is about comfort and feeling good"
                                                            subTitle:@""
                                                         pictureName:@"splash_11.jpg"
                                                            duration:13.0];
    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithTitle:@"Fashion fades, only style remains the same"
                                                            subTitle:@""
                                                         pictureName:@"splash_5.jpg"
                                                            duration:10.0];

    NSArray *tutorialLayers = @[layer1,layer2,layer3];
    
    // Set the common style for the title.
    ICETutorialLabelStyle *titleStyle = [[ICETutorialLabelStyle alloc] init];
    [titleStyle setFont:[UIFont fontWithName:@"Helvetica" size:17.0f]];
    [titleStyle setTextColor:[UIColor whiteColor]];
    [titleStyle setLinesNumber:1];
    [titleStyle setOffset:180];
    [[ICETutorialStyle sharedInstance] setTitleStyle:titleStyle];
    
   
    // Init tutorial.
    self.viewController = [[ICETutorialController alloc] initWithPages:tutorialLayers
                                                              delegate:self];
    
    // Run it.
   // [self.viewController startScrolling];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    
}

@end
