//
//  RTAppDelegate.m
//  PracticeProject
//
//  Created by 王福林 on 2015/7/25.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import "RTAppDelegate.h"

#import "MRCViewModelServicesImpl.h"

#import "MRCNavigationController.h"

#import "MRCTabBarViewModel.h"

//#import "MRCHomepageViewModel.h"
//#import "MRCHomepageViewController.h"

@interface RTAppDelegate ()


@property (nonatomic, strong) MRCViewModelServicesImpl *services;
@property (nonatomic, strong) MRCViewModel *viewModel;

@property (nonatomic, strong, readwrite) MRCNavigationControllerStack *navigationControllerStack;

//@property (nonatomic, strong) Reachability *reachability;
//@property (nonatomic, assign, readwrite) NetworkStatus networkStatus;

//@property (nonatomic, copy, readwrite) NSString *adURL;

@end

@implementation RTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configureFMDB];
    [self configureAppearance];
    [self configureKeyboardManager];
    [self configureReachability];

    self.services = [[MRCViewModelServicesImpl alloc] init];
    self.navigationControllerStack = [[MRCNavigationControllerStack alloc] initWithServices:self.services];
    
    MRCTabBarViewModel *tabBarViewModel = [[MRCTabBarViewModel alloc] initWithServices:self.services params:nil];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.services resetRootViewModel: tabBarViewModel];
    [self.window makeKeyAndVisible];
    
    [self configureAppearance];
    
    return YES;
}


#pragma mark - Application configuration

- (void)configureFMDB {
//    [[FMDatabaseQueue sharedInstance] inDatabase:^(FMDatabase *db) {
//        NSString *version = [[NSUserDefaults standardUserDefaults] valueForKey:MRCApplicationVersionKey];
//        if (![version isEqualToString:MRC_APP_VERSION]) {
//            if (version == nil) {
//                [SSKeychain deleteAccessToken];
//                
//                NSString *path = [[NSBundle mainBundle] pathForResource:@"update_v1_2_0" ofType:@"sql"];
//                NSString *sql  = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//                
//                if (![db executeStatements:sql]) {
//                    MRCLogLastError(db);
//                }
//            }
//        }
//    }];
}

- (void)configureAppearance {
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 0x2F434F
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:(48 - 40) / 215.0 green:(67 - 40) / 215.0 blue:(78 - 40) / 215.0 alpha:1];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    [UISegmentedControl appearance].tintColor = [UIColor whiteColor];
    
//    [UITabBar appearance].tintColor = HexRGB(colorI3);
}

- (void)configureKeyboardManager {
//    IQKeyboardManager.sharedManager.enableAutoToolbar = NO;
//    IQKeyboardManager.sharedManager.shouldResignOnTouchOutside = YES;
}

- (void)configureReachability {
//    self.reachability = Reachability.reachabilityForInternetConnection;
//    
//    RAC(self, networkStatus) = [[[[[NSNotificationCenter defaultCenter]
//                                   rac_addObserverForName:kReachabilityChangedNotification object:nil]
//                                  map:^(NSNotification *notification) {
//                                      return @([notification.object currentReachabilityStatus]);
//                                  }]
//                                 startWith:@(self.reachability.currentReachabilityStatus)]
//                                distinctUntilChanged];
//    
//    @weakify(self)
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        @strongify(self)
//        [self.reachability startNotifier];
//    });
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end