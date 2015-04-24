//
//  Scro2BroLoginViewController.m
//  scro2bro
//
//  Created by Darren Mason on 4/24/15.
//  Copyright (c) 2015 bitcows. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Scro2BroLoginViewController.h"
#import "SCSettings.h"

@interface Scro2BroLoginViewController ()
{
    BOOL _viewDidAppear;
    BOOL _viewIsVisible;
}
@end

@implementation Scro2BroLoginViewController

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
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    [self.view addSubview:loginButton];
    
    self.loginButton.readPermissions = @[@"public_profile", @"user_friends"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    SCSettings *settings = [SCSettings defaultSettings];
    if (_viewDidAppear) {
        _viewIsVisible = YES;
        
        // reset
        settings.shouldSkipLogin = NO;
    } else {
        if (settings.shouldSkipLogin || [FBSDKAccessToken currentAccessToken]) {
            [self performSegueWithIdentifier:@"showMain" sender:nil];
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
    
    [SCSettings defaultSettings].shouldSkipLogin = YES;
    _viewIsVisible = NO;
}

#pragma mark - Observations


#pragma mark - Login Delegates
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

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
