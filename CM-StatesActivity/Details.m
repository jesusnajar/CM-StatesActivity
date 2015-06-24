//
//  Details.m
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import "Details.h"
#import "Declarations.h"

@interface Details ()

@end

@implementation Details

/**********************************************************************************************/
#pragma mark - Delegate methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.lblState.text = maStates[miCellIndex];
    self.lblState.adjustsFontSizeToFitWidth = YES;
    self.lblGroup.text = maGroups[miCellIndex];
    self.lblGroup.adjustsFontSizeToFitWidth = YES;
    self.lblPoliticName.text = maPoliticNames[miCellIndex];
    self.lblPoliticName.adjustsFontSizeToFitWidth = YES;
    self.lblDescription.text = maDesc[miCellIndex];
    self.lblDescription.adjustsFontSizeToFitWidth = YES;
    
    if ([UIImage imageNamed:maLogos[miCellIndex]] == nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maLogos[miCellIndex]];
        self.imgHolder.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:cachedImagePath]];
    }else {
        self.imgHolder.image  = [UIImage imageNamed:maLogos[miCellIndex]];
    }

}

/**********************************************************************************************/
#pragma mark - Button Actions
/**********************************************************************************************/
- (IBAction)btnOkPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
