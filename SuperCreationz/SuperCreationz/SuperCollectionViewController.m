//
//  SuperCollectionViewController.m
//  SuperCreationz
//
//  Created by Cyan on 05/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import "SuperCollectionViewController.h"
#import "SuperCollectionViewCell.h"
#import "SuperLikesViewController.h"
#import "AppDelegate.h"

@interface SuperCollectionViewController () <UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
 
    NSMutableArray *fashionImages;
    NSMutableArray*likes;
    SuperCollectionViewCell* CustomCell;
    UIView *popup;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *CustomCollectionView;

@end

@implementation SuperCollectionViewController

@synthesize CustomCollectionView;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    CustomCollectionView.dataSource=self;
    CustomCollectionView.delegate=self;
    [CustomCollectionView setScrollEnabled:NO];
    fashionImages = [NSMutableArray arrayWithObjects:@"Fashion_1.jpg", @"Fashion_2.jpg", @"Fashion_3.jpg",@"Fashion_4.jpg", @"Fashion_5.jpg",@"Fashion_6.jpg",@"Fashion_7.jpg", nil];
}

- (IBAction)logOutAction:(id)sender {
    
    popup=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/5, self.view.frame.size.height/2-self.view.frame.size.width/2+100, self.view.frame.size.width/2+50, self.view.frame.size.height/4)];
    [popup setBackgroundColor:kCreamGray];
    [popup setAlpha:0.3];
    popup.layer.cornerRadius=8;
    popup.layer.masksToBounds = NO;
    popup.layer.shadowOffset = CGSizeMake(0, 0);
    popup.layer.shadowRadius = 1;
    popup.layer.shadowOpacity = 0.7;
    [self.view addSubview:popup];
   
    //animation
    
    popup.alpha = 0.0;
    // set frame before transform here...
    CGRect startFrame = popup.frame;
    popup.frame = startFrame;
    popup.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    [UIView animateWithDuration:0.6
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:15.0
                        options:0
                     animations:^{
                         popup.alpha = 1.0;
                         popup.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];

    UIButton*done=[[UIButton alloc]initWithFrame:CGRectMake(popup.frame.size.width/2-50, popup.frame.size.height-60, 100, 40)];
    [done addTarget:self action:@selector(doneclicked) forControlEvents:UIControlEventTouchUpInside];
    [done setTitle:@"Log out" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [popup addSubview:done];

    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc]initWithFrame:CGRectMake(popup.frame.size.width/2-75, popup.frame.size.height/2-30, 150, 40)];
    [popup addSubview:loginButton];

    self.view.alpha=0.7;
    

}

- (void)doneclicked {
  
    //Facebook logout check
    
        NSString *tokenValue = [[FBSDKAccessToken currentAccessToken] tokenString];
        if ([tokenValue length] == 0)
        {
            AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
            [appDelegate introView];
        }
        else
        {
    NSLog(@"User is Already logged ");
        }
        
    
    [UIView animateWithDuration:0.13
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         popup.transform = CGAffineTransformMakeScale(1.1, 1.1);
                     }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:0.13*2.0
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^(void){
                                              popup.alpha = 0.0;
                                              popup.transform = CGAffineTransformMakeScale(0.1, 0.1);
                                          }
                                          completion:nil];
                     }];
        self.view.alpha=1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [fashionImages count ] +1 ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    SuperCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [self configureCell:cell withIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(SuperCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row== [fashionImages count]) {
       [cell.customImageView setHidden:NO];
        cell.customImageView.image=[UIImage imageNamed:@"comeback.jpg"];
        cell.customImageView.layer.cornerRadius=20;
        cell.customImageView.layer.masksToBounds = YES;
        cell.customImageView.clipsToBounds = YES;
        [cell.likesButton setHidden:YES];
        [cell.customView setHidden:YES];
        [cell.DislikeButton setHidden:YES];
        
    }
    
    else {
        [cell.likesButton setHidden:NO];
        [cell.customView setHidden:NO];
        [cell.DislikeButton setHidden:NO];
        cell.customImageView.image=[UIImage imageNamed:[fashionImages objectAtIndex:indexPath.row]];
        cell.customImageView.layer.cornerRadius=20;
        cell.customImageView.layer.masksToBounds = YES;
        cell.customImageView.clipsToBounds = YES;
        cell.customView.layer.cornerRadius=20;
        cell.customView.layer.masksToBounds = YES;
        cell.customView.clipsToBounds = YES;
        [cell.likesButton addTarget:self action:@selector(likethis:) forControlEvents:UIControlEventTouchUpInside];
        [cell.DislikeButton addTarget:self action:@selector(Dislikethis:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
}

- (void)Dislikethis:(UIButton *) sender {
    NSIndexPath *indexPath;
    indexPath = [CustomCollectionView indexPathForItemAtPoint:[CustomCollectionView convertPoint:sender.center fromView:sender.superview]];
   
    if (indexPath.row== [fashionImages count]) {

        NSLog(@"lastobject");
    }
    else {
        NSIndexPath *nextItem = [NSIndexPath indexPathForItem:indexPath.item inSection:indexPath.section];
        [fashionImages removeObjectAtIndex:indexPath.row ];
        [CustomCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        [CustomCollectionView reloadData];
    }
}

- (void)likethis:(UIButton *) sender {
   
    NSIndexPath *indexPath;
    indexPath = [CustomCollectionView indexPathForItemAtPoint:[CustomCollectionView convertPoint:sender.center fromView:sender.superview]];

    if (indexPath.row== [fashionImages count]) {
        NSLog(@"lastobject");
    }
    else {
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
    [CustomCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SuperLikesViewController*new= segue.destinationViewController;
    new.likesfashionImages=fashionImages;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
