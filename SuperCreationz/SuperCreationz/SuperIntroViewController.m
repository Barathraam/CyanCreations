//
//  SuperIntroViewController.m
//  SuperCreationz
//
//  Created by Cyan on 05/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import "SuperIntroViewController.h"
#import "SuperCollectionViewController.h"
#import "AppDelegate.h"

@interface SuperIntroViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    
    UIImageView *firstImageFrame;
    UIImagePickerController *imagePicker;
    UIButton *pickerButton;
    UIButton *nextViewNavigation;
    
    BOOL newImage;
}

@end

@implementation SuperIntroViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.delegate=self;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self contentView];
    [self.view setBackgroundColor:kCreamGray];
 }


- (void)contentView {
    
    pickerButton = [UIButton autolayoutView];
    [pickerButton setTitle:@"Choose Your Style" forState:UIControlStateNormal];
    [pickerButton addTarget:self action:@selector(didClickOnPickerButton) forControlEvents:UIControlEventTouchUpInside];
    [pickerButton setBackgroundColor:kAwesomeColor];
    pickerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [pickerButton.layer setMasksToBounds:YES];
    [pickerButton.layer setCornerRadius:2.0f];
    pickerButton.layer.shadowOffset = CGSizeMake(0, 0);
    pickerButton.layer.shadowRadius = 1;
    pickerButton.layer.shadowOpacity = 0.7;
    
    firstImageFrame =[UIImageView autolayoutView];
    firstImageFrame.layer.cornerRadius=125;
    firstImageFrame.layer.masksToBounds = YES;
    firstImageFrame.clipsToBounds = YES;
    [firstImageFrame setContentMode:UIViewContentModeScaleAspectFill];
    
    nextViewNavigation = [UIButton autolayoutView ];
    [nextViewNavigation setTitle:@" Next " forState:UIControlStateNormal];
    [nextViewNavigation addTarget:self action:@selector(didClickOnNext) forControlEvents:UIControlEventTouchUpInside];
    [nextViewNavigation setBackgroundColor:kshareBlue];
    nextViewNavigation.translatesAutoresizingMaskIntoConstraints = NO;
    [nextViewNavigation.layer setMasksToBounds:YES];
    [nextViewNavigation.layer setCornerRadius:2.0f];
    [nextViewNavigation setHidden:YES];
    
    [self.view addSubview:pickerButton];
    [self.view addSubview:firstImageFrame];
    [self.view addSubview:nextViewNavigation];
    
    //autolayout
    
    NSDictionary *views = NSDictionaryOfVariableBindings(pickerButton,firstImageFrame,nextViewNavigation);
    NSDictionary *metrices = @{@"border":@10};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[pickerButton(40)]" options:0 metrics:metrices views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[pickerButton(190)]" options:0 metrics:metrices views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pickerButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pickerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[firstImageFrame(250)]" options:0 metrics:metrices views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[firstImageFrame(250)]" options:0 metrics:metrices views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:firstImageFrame attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.6 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:firstImageFrame attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[nextViewNavigation(50)]-(50)-|" options:0 metrics:metrices views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[nextViewNavigation]-|" options:0 metrics:metrices views:views]];
}

- (void)didClickOnPickerButton {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        
        imagePicker =[[UIImagePickerController alloc]init];
        imagePicker.delegate=self;
        imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        newImage=NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *pickedImage =[info objectForKey:UIImagePickerControllerOriginalImage];
    firstImageFrame.image=pickedImage;
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    [nextViewNavigation setHidden:NO];
    [pickerButton setHidden:YES];
}

-(void)didClickOnNext {
    UIStoryboard*story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SuperCollectionViewController*coll=(SuperCollectionViewController*) [story instantiateViewControllerWithIdentifier:@"collection"];
    [self.navigationController pushViewController:coll animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
