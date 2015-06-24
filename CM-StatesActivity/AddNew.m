//
//  AddNew.m
//  CM-StatesActivity
//
//  Created by Diego Alejandro Cruz Ramirez on 23/06/15.
//  Copyright (c) 2015 Master. All rights reserved.
//

#import "AddNew.h"
#import "Declarations.h"

UIImagePickerController *imgPicker;

@interface AddNew ()

@end

@implementation AddNew

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
    [[self.txtViewDesc layer] setBorderWidth:1];
    [[self.txtViewDesc layer] setCornerRadius:5];
    self.txtViewDesc.clipsToBounds = YES;
}

/**********************************************************************************************/
#pragma mark - Delegate methods
/**********************************************************************************************/
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    // Asignamos la imagen al Image View o realizamos las operaciones que necesitemos
    self.imgHolder.image = img;
    // Descargamos la ventana modal
    [self dismissModalViewControllerAnimated:YES];
}

/**********************************************************************************************/
#pragma mark - Button Actions
/**********************************************************************************************/
- (IBAction)btnAddImgPressed:(id)sender {
    // Preparamos el image picker
    imgPicker = [[UIImagePickerController alloc] init];
    [imgPicker setDelegate:self];
    
    // Establecemos el origen de la imagen (carrete)
    // Si queremos tomar una nueva imagen el valor será UIImagePickerControllerSourceTypeCamera
    [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    // Mostramos el control modal
    [self presentViewController:imgPicker animated:YES completion:nil];
}

- (IBAction)btnAddPressed:(id)sender {
    [maStates addObject: self.txtState.text];
    [maGroups addObject: self.txtGroup.text];
    [maPoliticNames addObject: self.txtPoliticName.text];
    [maDesc addObject: self.txtViewDesc.text];
    
    NSString *imgName = [self.txtGroup.text stringByAppendingString:@".png"];
    
    [imgName stringByReplacingOccurrencesOfString: @" " withString: @"_"];
    [maLogos addObject: imgName];
    
    UIImage *image = self.imgHolder.image;
    NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:imgName];
    [UIImagePNGRepresentation(image) writeToFile:cachedImagePath atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
