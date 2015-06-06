//
//  SuperLikesViewController.m
//  SuperCreationz
//
//  Created by Cyan on 06/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import "SuperLikesViewController.h"
#import "SuperTableViewCell.h"


@interface SuperLikesViewController () <UITableViewDataSource,UITableViewDelegate> {
    UIImage *passingData;
    SuperTableViewCell *cell;
}

@end

@implementation SuperLikesViewController

@synthesize customTableView,likesfashionImages;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    customTableView.dataSource=self;
    customTableView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 145;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [likesfashionImages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
     cell = [customTableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    //cell.LikesNameLabel.text=[likesNames objectAtIndex:indexPath.row];
    cell.customImageView.image=[UIImage imageNamed:[likesfashionImages objectAtIndex:indexPath.row]];
    cell.customImageView.layer.cornerRadius=70;
    cell.customImageView.clipsToBounds = YES;
    [cell.customImageView setContentMode:UIViewContentModeScaleAspectFill];
    cell.customImageView.tag=indexPath.row;
    cell.detailTextLabel.text=@"barath";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    passingData= [UIImage imageNamed:[likesfashionImages objectAtIndex:indexPath.row]];
    
    NSArray*share=[[NSArray alloc]initWithObjects: passingData,nil];
    UIActivityViewController*activity=[[UIActivityViewController alloc]initWithActivityItems:share applicationActivities:Nil];
    [self presentViewController:activity animated:YES completion:Nil];

    [customTableView reloadData];
    
}


@end
