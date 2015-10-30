//
//  AppDelegate.m
//  ScrollViewAutoLayout
//
//  Created by Daniel Barabander on 4/15/15.
//  Copyright (c) 2015 Flatiron. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSMutableString *stringx = [@"Jon" mutableCopy];
    NSString *string = @"Jon";
    
    NSLog(@"%lu", [stringx hash]); //13718612767629
    NSLog(@"%lu", [string hash]); //13718612767629
    NSLog(@"%p", &string);  //0x7fff51a7ade0
    NSLog(@"%p", &stringx); //0x7fff528a8de8
    NSUInteger stringy = (NSUInteger)string;
    NSLog(@"%lu", stringy);
    NSLog(@"%d" ,[string isEqualToString:stringx]); // TRUE
    return YES;
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
