//
//  JJWMainNavigationController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMainNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface JJWMainNavigationController ()

@end

@implementation JJWMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = self.view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 4.0f;
    layer.shadowOpacity = 0.80f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
}


@end
