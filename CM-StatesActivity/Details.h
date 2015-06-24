//
//  Details.h
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Details : UIViewController

//Objects
@property (strong, nonatomic) IBOutlet UIImageView *imgHolder;
@property (strong, nonatomic) IBOutlet UILabel *lblGroup;
@property (strong, nonatomic) IBOutlet UILabel *lblState;
@property (strong, nonatomic) IBOutlet UILabel *lblPoliticName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

//Actions
- (IBAction)btnOkPressed:(id)sender;

@end
