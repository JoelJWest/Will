//
//  JJWMainNavigationController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWTodayNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface JJWTodayNavigationController ()
@end

@implementation JJWTodayNavigationController


#pragma mark Initilization Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addShadow];
}

- (void)addShadow
{
    CALayer *layer = self.view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}

@end
