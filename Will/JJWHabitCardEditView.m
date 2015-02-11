//
//  JJWHabitCardEditView.m
//  Will
//
//  Created by Joel J. West on 2/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWHabitCardEditView.h"

@implementation JJWHabitCardEditView

+ (instancetype)viewFromNib
{
    NSString *className = NSStringFromClass([self class]);
    NSArray *xib = [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil];
    return [xib objectAtIndex:0];
}

@end
