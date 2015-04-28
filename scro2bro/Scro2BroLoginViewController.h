//
//  Scro2BroLoginViewController.h
//  scro2bro
//
//  Created by Darren Mason on 4/24/15.
//  Copyright (c) 2015 bitcows. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <UIKit/UIKit.h>

@interface Scro2BroLoginViewController : UIViewController<FBSDKLoginButtonDelegate>

@property (nonatomic, strong) IBOutlet FBSDKLoginButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *takeMeBack;

@end
