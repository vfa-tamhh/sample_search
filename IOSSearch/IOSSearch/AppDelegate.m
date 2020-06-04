//
//  AppDelegate.m
//  IOSSearch
//
//  Created by Jimmy Huynh on 6/2/20.
//  Copyright © 2020 Jimmy Huynh. All rights reserved.
//

#import "AppDelegate.h"
#import <NCMB/NCMB.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [NCMB setApplicationKey:@"b2ee91d471db6e2505ac46e19a4bb594128403067237bda7ce29e232aeb9e77f" clientKey:@"1005a095286c018632636d8db9e0092490a67c7b6a94a1ab868a9c082f30b567"];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
