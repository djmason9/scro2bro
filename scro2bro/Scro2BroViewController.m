//
//  ViewController.m
//  scro2bro
//
//  Created by Darren Mason on 4/24/15.
//  Copyright (c) 2015 bitcows. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Scro2BroViewController.h"

@interface Scro2BroViewController ()

@end

@implementation Scro2BroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    //    PFInstallation *installation = [PFInstallation currentInstallation];
    //    [installation setObject:@"djmason9@gmail.com" forKey:@"email"];
    //    [installation saveInBackground];
    
    //    PFPush *push = [[PFPush alloc] init];
    //    [push setChannel:@"BRO"];
    //    [push setMessage:@"The Bro just scored!"];
    //    [push sendPushInBackground];
    
    // Create our Installation query
    
    //    PFQuery *pushQuery = [PFInstallation query];
    //    [pushQuery whereKey:@"email" equalTo:@"aaronj3.14@gmail.com"];
    //
    //    // Send push notification to query
    //    PFPush *push = [[PFPush alloc] init];
    //    [push setQuery:pushQuery]; // Set our Installation query
    //    [push setMessage:@"Aaron Scro!"];
    //    [push sendPushInBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
