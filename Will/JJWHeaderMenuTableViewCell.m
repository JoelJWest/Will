//
//  JJWHeaderMenuTableViewCell.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWHeaderMenuTableViewCell.h"
#include <math.h>

@interface JJWHeaderMenuTableViewCell()
@property (strong, nonatomic) IBOutlet UIView *squareView;
@end
@implementation JJWHeaderMenuTableViewCell

- (void)awakeFromNib
{
    CAShapeLayer *circleLayerWhite = [CAShapeLayer layer];
    circleLayerWhite.bounds = self.squareView.frame;
    circleLayerWhite.position = self.squareView.center;
    
    UIBezierPath *circleWhite = [UIBezierPath bezierPathWithArcCenter:self.percentageCompleteLabel.center radius:self.squareView.frame.size.width/2  startAngle:-M_PI/2 endAngle:(M_PI/2) * 3 clockwise:YES];
    circleLayerWhite.path = circleWhite.CGPath;
    
    circleLayerWhite.strokeColor = [UIColor whiteColor].CGColor;
    circleLayerWhite.lineWidth   = 10.0;
    circleLayerWhite.fillColor = [UIColor clearColor].CGColor;
    [self.squareView.layer addSublayer:circleLayerWhite];
    
    
    CAShapeLayer *circleLayerRed = [CAShapeLayer layer];
    circleLayerRed.bounds = self.squareView.frame;
    circleLayerRed.position = self.squareView.center;
    
    UIBezierPath *circleRed = [UIBezierPath bezierPathWithArcCenter:self.percentageCompleteLabel.center radius:self.squareView.frame.size.width/2  startAngle:-M_PI/2 endAngle:M_PI clockwise:YES];
    circleLayerRed.path = circleRed.CGPath;
    
    circleLayerRed.strokeColor = [UIColor colorWithRed:177/255.f green:5/255.f blue:17/255.f alpha:1].CGColor;
    circleLayerRed.lineWidth   = 10.0;
    circleLayerRed.fillColor = [UIColor clearColor].CGColor;
    [self.squareView.layer addSublayer:circleLayerRed];
    
    CAShapeLayer *circleLayerGreen = [CAShapeLayer layer];
    circleLayerGreen.bounds = self.squareView.frame;
    circleLayerGreen.position = self.squareView.center;
    
    UIBezierPath *circleGreen = [UIBezierPath bezierPathWithArcCenter:self.percentageCompleteLabel.center radius:self.squareView.frame.size.width/2  startAngle:-M_PI/2 endAngle:M_PI/2.3 clockwise:YES];
    circleLayerGreen.path = circleGreen.CGPath;
    
    circleLayerGreen.strokeColor = [UIColor colorWithRed:93/255.f green:171/255.f blue:70/255.f alpha:1].CGColor;
    circleLayerGreen.lineWidth   = 10.0;
    circleLayerGreen.fillColor = [UIColor clearColor].CGColor;
    [self.squareView.layer addSublayer:circleLayerGreen];

}


@end
