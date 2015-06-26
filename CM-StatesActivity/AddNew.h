//
//  AddNew.h
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNew : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

//Objects
@property (strong, nonatomic) IBOutlet UIImageView *imgHolder;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtPoliticName;
@property (strong, nonatomic) IBOutlet UITextField *txtGroup;
@property (strong, nonatomic) IBOutlet UITextView *txtViewDesc;
@property (strong, nonatomic) IBOutlet UIButton *btnAdd;

//Actions
- (IBAction)btnAddImgPressed:(id)sender;
- (IBAction)btnAddPressed:(id)sender;
- (IBAction)btnCancelPressed:(id)sender;

@end
