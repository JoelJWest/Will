//
//  JJWMainViewController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMainViewController.h"
#import "JJWMenuViewController.h"

@interface JJWMainViewController ()
@property (nonatomic) CGPoint startTouch;
@end

@implementation JJWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuAction)];
    self.navigationItem.leftBarButtonItem = menuButton;
}

-(void)menuAction{
    
    [self.delegate animateMenuReverse];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint localPoint = [touch locationInView:self.view];
    if (localPoint.x < 100){
        self.startTouch = [touch locationInView:self.navigationController.parentViewController.view.window];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.navigationController.parentViewController.view.window];
    CGPoint localPoint = [touch locationInView:self.view];
    if (localPoint.x < 100){
        int movement = touchPoint.x - self.startTouch.x;
    
        [self.delegate didDragWithMovment:movement];
        self.startTouch = touchPoint;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.delegate animateMenu];
}

@end
