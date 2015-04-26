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

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;


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

#pragma mark - contacts
-(IBAction)showAddressBook:(id)sender{
    _addressBookController = [[ABPeoplePickerNavigationController alloc] init];
    [_addressBookController setPeoplePickerDelegate:self];
    [self presentViewController:_addressBookController animated:YES completion:nil];
}


// Called after a person has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
    //check to see if that scro is a bro
    [self displayPerson:person];
    

}
- (void)displayPerson:(ABRecordRef)person
{
//    NSMutableDictionary *contactInfoDict = [NSMutableDictionary dictionary];
    
    NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSLog(@"NAME: %@",name);
    
    ABMultiValueRef emailsRef = ABRecordCopyValue(person, kABPersonEmailProperty);
    if(emailsRef){
    for (int i=0; i<ABMultiValueGetCount(emailsRef); i++) {
        CFStringRef currentEmailLabel = ABMultiValueCopyLabelAtIndex(emailsRef, i);
        CFStringRef currentEmailValue = ABMultiValueCopyValueAtIndex(emailsRef, i);
        
        if (CFStringCompare(currentEmailLabel, kABHomeLabel, 0) == kCFCompareEqualTo) {
//            [contactInfoDict setObject:(__bridge NSString *)currentEmailValue forKey:@"homeEmail"];
            
            NSLog(@"Home Email: %@",(__bridge NSString *)currentEmailValue);
        }
        
        if (CFStringCompare(currentEmailLabel, kABWorkLabel, 0) == kCFCompareEqualTo) {
//            [contactInfoDict setObject:(__bridge NSString *)currentEmailValue forKey:@"workEmail"];
            NSLog(@"Work Email: %@",(__bridge NSString *)currentEmailValue);
        }
        
        if (CFStringCompare(currentEmailLabel, kABOtherLabel, 0) == kCFCompareEqualTo) {
//            [contactInfoDict setObject:(__bridge NSString *)currentEmailValue forKey:@"otherEmail"];
            NSLog(@"Other Email: %@",(__bridge NSString *)currentEmailValue);
        }

        CFRelease(currentEmailLabel);
        CFRelease(currentEmailValue);
    }
    
    CFRelease(emailsRef);
    }
    
    NSString* phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSString*)
        ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    } else {
        phone = @"[None]";
    }
    
     NSLog(@"PHONE: %@",phone);
    
    CFRelease(phoneNumbers);
}


// Called after a property has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
}

// Called after the user has pressed cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
}

@end
