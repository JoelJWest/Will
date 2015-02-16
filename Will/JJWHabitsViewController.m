//
//  JJWHabitsViewController.m
//  Will
//
//  Created by Joel J. West on 2/9/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWHabitsViewController.h"
#import "JJWMacros.h"
#import "JJWHabitCardTableViewCell.h"
#import "JJWMenuGestureRecognizer.h"


@interface JJWHabitsViewController () <UITableViewDataSource, UITableViewDelegate, JJWHabitCardTableViewCellDelegate>
@property (nonatomic) CGPoint startTouch;
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL editing;
@end

@implementation JJWHabitsViewController


#pragma mark Initilization Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addMenuButtonWithGesture];
    [self configureTitleBar];
    [self configureTableView];
    self.editing = NO;
}

- (void)configureTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *cardViewNib = [UINib nibWithNibName:@"JJWHabitCardTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cardViewNib forCellReuseIdentifier:@"CardCell"];
    
    JJWMenuGestureRecognizer *menuPanGesture = [[JJWMenuGestureRecognizer alloc] initWithTarget:self action:@selector(wasDragged:)];
    menuPanGesture.cancelsTouchesInView = NO;
    
    [self.tableView addGestureRecognizer:menuPanGesture];
}

- (void)addMenuButtonWithGesture
{
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"HamburgerIconBlue.png"] forState:UIControlStateNormal];
    menuButton.frame = CGRectMake(0, -20, 30, 30);
    [menuButton addTarget:self action:@selector(menuAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wasDragged:)];
    panRecognizer.cancelsTouchesInView = NO;
   
    [menuButton addGestureRecognizer:panRecognizer];
}

- (void)configureTitleBar
{
   
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                                   Blue_Color, NSForegroundColorAttributeName,
                                                                   [UIFont fontWithName:@"Roboto-Regular" size:25], NSFontAttributeName,nil
                                                                   ];
    self.navigationItem.title = @"Habits";
    
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


#pragma mark TableView Delegate/DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JJWHabitCardTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CardCell"];
    cell.cellIndex = indexPath;
    cell.delegate = self;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280;
}


#pragma mark CardView Delegate Methods

- (void)didPressEditButtonOnCardAt:(NSIndexPath *)indexPath
{
    if (self.editing == NO){
        JJWHabitCardTableViewCell *selectedCell = (JJWHabitCardTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 300, 0);
    
        [UIView transitionWithView:selectedCell.cardBackground  duration:0.5 options:   UIViewAnimationOptionTransitionFlipFromRight animations:^{
                selectedCell.mainView.hidden = YES;
                [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
        completion:^(BOOL finished) {}];
        self.tableView.scrollEnabled = NO;
        self.editing = YES;
    }
}

-(void)didPressSaveButtonOnCardAt:(NSIndexPath *)indexPath
{
    if (self.editing == YES){
        JJWHabitCardTableViewCell *selectedCell = (JJWHabitCardTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
        [UIView transitionWithView:selectedCell.cardBackground  duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                selectedCell.mainView.hidden = NO;
        }
        completion:^(BOOL finished){
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.3];
            [self.tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
            [UIView commitAnimations];
            self.tableView.scrollEnabled = YES;
        }];
        self.editing = NO;
    }
}


@end


