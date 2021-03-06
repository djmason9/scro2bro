//
//  Scro2BroLoginViewController.m
//  scro2bro
//
//  Created by Darren Mason on 4/24/15.
//  Copyright (c) 2015 bitcows. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Scro2BroLoginViewController.h"
#import "Scro2broSettings.h"

@interface Scro2BroLoginViewController ()
{
    BOOL _viewDidAppear;
    BOOL _viewIsVisible;
}
@end

@implementation Scro2BroLoginViewController
- (IBAction)takeMeBack:(id)sender {
    [self performSegueWithIdentifier:@"showMain" sender:self];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // We wire up the FBSDKLoginButton using the interface builder
        // but we could have also explicitly wired its delegate here.
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    Scro2broSettings *settings = [Scro2broSettings defaultSettings];
    if (_viewDidAppear) {
        _viewIsVisible = YES;
        [_takeMeBack setHidden:NO];
        // reset
        settings.shouldSkipLogin = NO;
    } else {
        if (settings.shouldSkipLogin || [FBSDKAccessToken currentAccessToken]) {
            [self performSegueWithIdentifier:@"showMain" sender:nil];
            [_takeMeBack setHidden:YES];
        } else {
            _viewIsVisible = YES;
        }
        _viewDidAppear = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [Scro2broSettings defaultSettings].shouldSkipLogin = YES;
    _viewIsVisible = NO;
}

#pragma mark - Logout
- (IBAction)showLogin:(UIStoryboardSegue *)segue
{
    // This method exists in order to create an unwind segue to this controller.
}

#pragma mark - Login Delegates
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    [_takeMeBack setHidden:YES];
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    //welcome back from shitbook.. did you get the stuff?
    if(error){
        //shitbook gave an error!
        NSLog(@"Unexpected login error: %@", error);
        NSString *alertMessage = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?: @"There was a problem logging in. Please try again later.";
        NSString *alertTitle = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops";
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        
    }else{
        
        if (_viewIsVisible) {
            
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
            
            UIApplication *application = [UIApplication sharedApplication];
            
            if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
                UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                                UIUserNotificationTypeBadge |
                                                                UIUserNotificationTypeSound);
                UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                         categories:nil];
                [application registerUserNotificationSettings:settings];
                [application registerForRemoteNotifications];
            } else
#endif
            {
                [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                                 UIRemoteNotificationTypeAlert |
                                                                 UIRemoteNotificationTypeSound)];
            }
            [self performSegueWithIdentifier:@"showMain" sender:self];
        }
    }

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
