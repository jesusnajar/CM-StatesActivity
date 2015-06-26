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
    maStates        = [[NSMutableArray alloc] initWithObjects: @"Campeche", @"Chiapas", @"Colima", @"Guanajuato", @"Guerrero", @"Hidalgo", @"Jalisco", @"México", @"Nayarit", @"Oaxaca",nil];
    maGroups        = [[NSMutableArray alloc] initWithObjects: @"PRI", @"PVEM", @"PRI", @"PAN", @"PRD",@"PRI", @"PRI", @"PRI", @"PRI", @"MORENA",nil];
    maPoliticNames  = [[NSMutableArray alloc] initWithObjects: @"Fernando Ortega", @"Manuel Velasco", @"Mario Anguiano",  @"Miguel Márquez",   @"Rogelio Ortega", @"Francisco Olvera", @"Aristoteles Sandoval", @"Eruviel Ávila", @"Roberto Sandoval", @"Gabino Cué",nil];
    maLogos         = [[NSMutableArray alloc] initWithObjects: @"pri.png", @"verde.png", @"pri.png", @"pan.png", @"prd.png", @"pri.png", @"pri.png", @"pri.png", @"pri.png", @"morena.png",nil];
    maDesc          = [[NSMutableArray alloc] initWithObjects: @"16 septiembre 2009\n15 septiembre 2015\nLic. en Ciencias Politicas\nUniversidad Autónoma de Campeche",
                       @"8 diciembre 2012\n7 diciembre 2018\nLic. en Derecho\nUniversidad Humanitas",
                       @"1 noviembre 2009\n31 octubre 2015\nLic. en Economía\nUniversidad de Colima",
                       @"26 septiembre 2012\n25 septiembre 2018\nLic. en Derecho\nU. de La Salle Bajío",
                       @"26 octubre 2014\n31 marzo 2015\nLic. en Sociología\nUniversidad Autónoma de Guerrero",
                       @"1 abril 2011\n31 marzo 2016\nLic. en Derecho\nUniversidad Autónoma del Estado de Hidalgo",
                       @"1 marzo 2013\n28 febrero 2019\nLic. en Derecho\nU.de.G.",
                       @"15 septiembre 2011\n14 septiembre 2017\nDr. en Derecho\nUniversidad Nacional Autonóma de México",
                       @"19 septiembre 2011\n18 septiembre 2017\nEstudios parciales\nIng. en Agronoma",
                       @"1 diciembre 2010\n30 noviembre 2016\nLic. en Economía\nTecnológico de Monterrey",nil];
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
