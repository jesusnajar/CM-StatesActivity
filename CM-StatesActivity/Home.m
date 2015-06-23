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
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    maStates             = [[NSMutableArray alloc] initWithObjects: @"Charros de Jalisco", @"Tomateros de Culiacán", @"Naranjeros de Hermosillo", @"Venados de Mazatlán", @"Cañeros de Los Mochis", @"Aguilas de Mexicali", @"Yaquis de Obregón", @"Mayos de Navojoa",nil];
    maLogos         = [[NSMutableArray alloc] initWithObjects: @"charros.png", @"tomateros.png", @"naranjeros.png", @"venados.png", @"mochis.png", @"aguilas.png", @"yaquis.png", @"mayos.png",nil];
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
    cell.lblPoliticName.text   = maPoliticNames[indexPath.row];
    cell.imgLogo.image  = [UIImage imageNamed:maLogos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
