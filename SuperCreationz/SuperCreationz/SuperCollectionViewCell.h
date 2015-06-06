//
//  SuperCollectionViewCell.h
//  SuperCreationz
//
//  Created by Cyan on 06/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *customImageView;
@property (strong, nonatomic) IBOutlet UIButton *likesButton;
@property (strong, nonatomic) IBOutlet UIButton *DislikeButton;
@property (strong, nonatomic) IBOutlet UIView *customView;

@end
