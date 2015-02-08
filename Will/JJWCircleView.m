//
//  JJWCircleView.m
//  Will
//
//  Created by Joel J. West on 2/7/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWCircleView.h"

@implementation JJWCircleView

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width, self.frame.size.height)
                                                          radius:self.frame.size.height/2
                                                      startAngle:0
                                                        endAngle:2.0*M_PI
                                                       clockwise:YES];
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.bounds = self.bounds;
    circleLayer.path   = circle.CGPath;
    circleLayer.strokeColor = [UIColor colorWithRed:0.185447 green:0.185442 blue:0.185445 alpha:1].CGColor;
    circleLayer.lineWidth   = 1.0; // your line width
    circleLayer.fillColor = [UIColor colorWithRed:0.185447 green:0.185442 blue:0.185445 alpha:1].CGColor;
    [self.layer addSublayer:circleLayer];
    
    
    
    UIBezierPath *yellowCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width, self.frame.size.height)
                                                          radius:self.frame.size.height/2-12
                                                      startAngle:0
                                                        endAngle:2.0*M_PI
                                                       clockwise:YES];
    
    CAShapeLayer *yellowCircle = [CAShapeLayer layer];
    yellowCircle.bounds = self.bounds;
    yellowCircle.path   = yellowCirclePath.CGPath;
    yellowCircle.strokeColor = [UIColor colorWithRed:252/255.0f green:173/255.0f blue:55/255.0f alpha:1].CGColor;
    yellowCircle.lineWidth   = 12.0; // your line width
    yellowCircle.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:yellowCircle];
    
    UIBezierPath *redCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width, self.frame.size.height)
                                                                    radius:self.frame.size.height/2-12
                                                                startAngle:-M_PI/2
                                                                  endAngle:.743*M_PI
                                                                 clockwise:YES];
    
    CAShapeLayer *redCircle = [CAShapeLayer layer];
    redCircle.bounds = self.bounds;
    redCircle.path   = redCirclePath.CGPath;
    redCircle.strokeColor = [UIColor colorWithRed:177/255.0f green:5/255.0f blue:17/255.0f alpha:1].CGColor;
    redCircle.lineWidth   = 12.0; // your line width
    redCircle.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:redCircle];
    
    
    UIBezierPath *greenCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width, self.frame.size.height)
                                                                 radius:self.frame.size.height/2-12
                                                             startAngle:-M_PI/2
                                                               endAngle:.3345*M_PI
                                                              clockwise:YES];
    
    CAShapeLayer *greenCircle = [CAShapeLayer layer];
    greenCircle.bounds = self.bounds;
    greenCircle.path   = greenCirclePath.CGPath;
    greenCircle.strokeColor = [UIColor colorWithRed:93/255.0f green:171/255.0f blue:70/255.0f alpha:1].CGColor;
    greenCircle.lineWidth   = 12.0; // your line width
    greenCircle.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:greenCircle];
}

@end
