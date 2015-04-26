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
    self.profilePictureButton.profileID = @"me";
    
    // Do any additional setup after loading the view, typically from a nib.

    
//        PFInstallation *installation = [PFInstallation currentInstallation];
//        [installation setObject:@"djmason9@gmail.com" forKey:@"email"];
//        [installation saveInBackground];
    
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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.profilePictureButton.pictureCropping = FBSDKProfilePictureModeSquare;
    
    
//    if ([FBSDKAccessToken currentAccessToken]) {
//        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
//         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//             if (!error) {
//                 NSLog(@"fetched user:%@", result);
//             }
//         }];
//    }
    
}
- (IBAction)sendScro:(id)sender {

//    
//    [PFUser logInWithUsernameInBackground:@"Darren" password:@"password"
//            block:^(PFUser *user, NSError *error) {
//                if (user) {
//                    PFQuery *pushQuery = [PFInstallation query];
//                    [pushQuery whereKey:@"userId" equalTo:[user objectId]];
//                    
//                    // Send push notification to query
//                    PFPush *push = [[PFPush alloc] init];
//                    [push setQuery:pushQuery]; // Set our Installation query
//                    [push setMessage:@"Scro?"];
//                    [push sendPushInBackground];
//                } else {
//                    // The login failed. Check error to see why.
//                }
//            }];
    
//    // Send push notification to query
    PFPush *push = [[PFPush alloc] init];
    [push setMessage:@"Sup SCRO!"];
    [push sendPushInBackground];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
