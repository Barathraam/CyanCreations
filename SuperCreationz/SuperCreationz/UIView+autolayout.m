//
//  UIView+autolayout.m
//  SuperCreationz
//
//  Created by Cyan on 05/06/15.
//  Copyright (c) 2015 BarathRaam. All rights reserved.
//

#import "UIView+autolayout.h"

@implementation UIView (autolayout)

+(id)autolayoutView{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

-(id)autolayoutView{
    UIView *view = [self init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
