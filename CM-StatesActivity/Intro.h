//
//  Intro.h
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Intro : UIViewController

//Objects
@property NSUInteger                                iPageIndex;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;
@property (strong, nonatomic) IBOutlet UILabel *lblIntro;
@property (strong, nonatomic) IBOutlet UIButton *btnSkip;

//Actions
- (IBAction)btnSkipPressed:(id)sender;

@end
