//
//  CustomCellState.h
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 22/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellState : UITableViewCell

//Objects
@property (strong, nonatomic) IBOutlet UIImageView *imgLogo;
@property (strong, nonatomic) IBOutlet UILabel *lblState;
@property (strong, nonatomic) IBOutlet UILabel *lblPoliticName;

@end
