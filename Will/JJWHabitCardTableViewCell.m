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
    
    self.textField.delegate = self;
}

- (IBAction)editButtonTouchUpInside:(id)sender
{
    [self.delegate didPressEditButtonOnCardAt:self.cellIndex];
}

- (IBAction)saveButtonTouchUpInside:(id)sender
{
    [self.delegate didPressSaveButtonOnCardAt:self.cellIndex];
    [self.textField resignFirstResponder];
}

- (IBAction)sundayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)mondayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)tuesdayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)wednesdayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)thursdayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)fridayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (IBAction)saturdayButtonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    if (button.selected == YES){
        button.selected = NO;
    }
    else {
        button.selected = YES;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}

@end
