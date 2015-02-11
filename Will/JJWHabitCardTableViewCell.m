//
//  JJWHabitCardTableViewCell.m
//  Will
//
//  Created by Joel J. West on 2/10/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWHabitCardTableViewCell.h"

@implementation JJWHabitCardTableViewCell

- (void)awakeFromNib
{
    self.cardBackground.layer.shadowOffset = CGSizeMake(1, 0);
    self.cardBackground.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.cardBackground.layer.shadowRadius = 4.f;
    self.cardBackground.layer.shadowOpacity = .25;
    
    CGRect shadowFrame = self.cardBackground.layer.bounds;
    CGPathRef shadowPath = [UIBezierPath bezierPathWithRect:shadowFrame].CGPath;
    
    self.cardBackground.layer.shadowPath = shadowPath;
}

@end
