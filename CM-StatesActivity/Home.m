//
//  Home.m
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import "Home.h"
#import "CustomCellState.h"
#import "Declarations.h"
#import "AddNew.h"
#import "Details.h"

@interface Home ()

@end

@implementation Home

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tblMain reloadData];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    maStates        = [[NSMutableArray alloc] initWithObjects: @"Colima", @"Jalisco", @"Nayarit", @"Nayarit", @"Nayarit", @"Nayarit", @"Nayarit", @"Nayarit", @"Nayarit", @"Nayarit",nil];
    maGroups        = [[NSMutableArray alloc] initWithObjects: @"PRI", @"PAN", @"PRD", @"PRD", @"PRD",@"PRD", @"PRD", @"PRD", @"PRD", @"PRD",nil];
    maPoliticNames  = [[NSMutableArray alloc] initWithObjects: @"Mario Moreno", @"Aristoteles Sandoval", @"Roberto Sandoval",  @"Roberto Sandoval",   @"Roberto Sandoval", @"Roberto Sandoval", @"Roberto Sandoval", @"Roberto Sandoval", @"Roberto Sandoval", @"Roberto Sandoval",nil];
    maLogos         = [[NSMutableArray alloc] initWithObjects: @"pri.png", @"pan.png", @"prd.png", @"prd.png", @"prd.png", @"prd.png", @"prd.png", @"prd.png", @"prd.png", @"prd.png",nil];
    maDesc          = [[NSMutableArray alloc] initWithObjects: @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",
                       @"bla bla bla bla bla bla bla bla bla bla bla bla bla",nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maStates.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    CustomCellState *cell = (CustomCellState *)[tableView dequeueReusableCellWithIdentifier:@"CustomCellState"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCellState" bundle:nil] forCellReuseIdentifier:@"CustomCellState"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellState"];
    }
    //Fill cell with info from arrays
    cell.lblState.text   = maStates[indexPath.row];
    cell.lblState.adjustsFontSizeToFitWidth = YES;
    cell.lblPoliticName.text   = maPoliticNames[indexPath.row];
    cell.lblPoliticName.adjustsFontSizeToFitWidth = YES;
    //Check if there are not image in the carpet and load the image from memory
    if ([UIImage imageNamed:maLogos[indexPath.row]] == nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maLogos[indexPath.row]];
        cell.imgLogo.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:cachedImagePath]];
    }else {
        cell.imgLogo.image  = [UIImage imageNamed:maLogos[indexPath.row]];
    }
    cell.lblGroup.text = maGroups[indexPath.row];
    cell.lblGroup.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCellIndex = (int)indexPath.row;
    Details *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Details"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAdd:(id)sender {
    AddNew *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddNew"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
