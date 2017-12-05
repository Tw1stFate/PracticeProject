//
//  RTAppDelegate.h
//  PracticeProject
//
//  Created by lynn on 2015/7/25.
//  Copyright © 2015年 lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRCNavigationControllerStack.h"

@interface RTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) MRCNavigationControllerStack *navigationControllerStack;

@end
