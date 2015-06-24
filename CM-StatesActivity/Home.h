//
//  Home.h
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Home : UIViewController

//Actions
- (IBAction)btnAdd:(id)sender;

//Objects
@property (strong, nonatomic) IBOutlet UITableView *tblMain;

@end
