//
//  ViewController.h
//  scro2bro
//
//  Created by Darren Mason on 4/24/15.
//  Copyright (c) 2015 bitcows. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

#import "Scro2BroProfilePictureButton.h"

@interface Scro2BroViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet Scro2BroProfilePictureButton *profilePictureButton;
@property (strong, nonatomic) IBOutlet UIPickerView *profileEmailPicker;

@end

