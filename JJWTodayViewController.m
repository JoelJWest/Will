//
//  JJWMainViewController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWTodayViewController.h"
#import "JJWMenuGestureRecognizer.h"

@interface JJWTodayViewController ()
@property (nonatomic) CGPoint startTouch;
@property (nonatomic) IBOutlet UITableView *tableView;
@end

@implementation JJWTodayViewController


#pragma mark Initilization Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addMenuButtonWithGesture];
}

- (void)addMenuButtonWithGesture
{
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menuIcon.png"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, 0, 30, 30);
    [menuButton addTarget:self action:@selector(menuAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
 
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wasDragged:)];
    panRecognizer.cancelsTouchesInView = NO;
    
    JJWMenuGestureRecognizer *menuPanGesture = [[JJWMenuGestureRecognizer alloc] initWithTarget:self action:@selector(wasDragged:)];
    menuPanGesture.cancelsTouchesInView = NO;
    
    [self.tableView addGestureRecognizer:menuPanGesture];
    [menuButton addGestureRecognizer:panRecognizer];
}


#pragma  mark Gesture and Menu Button Methods

- (void)wasDragged:(UIPanGestureRecognizer *)recognizer
{
    UIButton *button = (UIButton *)recognizer.view;
    CGPoint translation = [recognizer translationInView:button];
    [self.delegate didDragWithMovment:translation.x];
    [recognizer setTranslation:CGPointZero inView:button];
    
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        [self.delegate animateMenu];
    }
}

- (void)menuAction
{
    [self.delegate animateMenuReverse];
}


#pragma  mark Touches Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint localPoint = [touch locationInView:self.view];
    if (localPoint.x < 100){
        self.startTouch = [touch locationInView:self.navigationController.parentViewController.view.window];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.delegate animateMenu];
}

@end
