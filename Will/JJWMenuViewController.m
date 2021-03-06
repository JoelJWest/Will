//
//  JJWMenuViewController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "JJWMacros.h"
#import "JJWMenuTableViewCell.h"
#import "JJWMenuHeaderTableViewCell.h"
#import "JJWMenuCircleTableViewCell.h"
#import "JJWTodayNavigationController.h"
#import "JJWTodayViewController.h"
#import "JJWHabitsNavigationController.h"
#import "JJWHabitsViewController.h"

@interface JJWMenuViewController () <UITableViewDataSource, UITableViewDelegate, JJWTodayViewControllerDelegate, JJWHabitsViewControllerDelegate>

@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *menuItems;
@property (nonatomic) IBOutlet UIView *containerView;

@end


@implementation JJWMenuViewController


#pragma mark Initilization Methods

- (instancetype)initFirstTime
{
    self = [super init];
    if (self){
        [[NSBundle mainBundle] loadNibNamed:@"JJWMenuViewController" owner:self options:nil];
        [self setUpMenuItems];
        [self setUpTableView];
        [self addTopViewController];
    }
    return self;
}

- (void)addTopViewController
{
    JJWTodayViewController *homeViewController = [[JJWTodayViewController alloc] init];
    homeViewController.delegate = self;
    JJWTodayNavigationController *homeNavContoller = [[JJWTodayNavigationController alloc] initWithRootViewController:homeViewController];
    homeNavContoller.view.frame = self.containerView.frame;
    
    [self addChildViewController:homeNavContoller];
    [self.containerView addSubview:homeNavContoller.view];
}

- (void)setUpTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *menuTableViewNib = [UINib nibWithNibName:@"JJWMenuTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuTableViewNib forCellReuseIdentifier:@"MenuCell"];
    UINib *menuHeaderTableViewNib = [UINib nibWithNibName:@"JJWMenuHeaderTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuHeaderTableViewNib forCellReuseIdentifier:@"MenuHeaderCell"];
    UINib *menuCircleTableViewNib = [UINib nibWithNibName:@"JJWMenuCircleTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuCircleTableViewNib forCellReuseIdentifier:@"MenuCircleCell"];
    
    CALayer *grayLayer = [CALayer layer];
    grayLayer.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.x, self.tableView.frame.size.width, self.tableView.frame.size.height/2);
    grayLayer.backgroundColor = [UIColor colorWithRed:0.185447 green:0.185442 blue:0.185445 alpha:1].CGColor;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.x, self.tableView.frame.size.width, self.tableView.frame.size.height)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [backgroundView.layer insertSublayer:grayLayer atIndex:1];
    self.tableView.backgroundView = backgroundView;
 
    CGRect screen = [UIScreen mainScreen].bounds;
    
    if (screen.size.height > 568){
        self.tableView.bounces = NO;
        self.tableView.scrollEnabled = NO;
    }
    else{
        self.tableView.bounces = YES;
        self.tableView.scrollEnabled = YES;
    }
}

- (void)setUpMenuItems
{
    self.menuItems = @[@"Today",@"Habits",@"Meals",@"Workouts",@"Settings"];
}


#pragma mark TableView Delegate and Datasource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        
        JJWMenuHeaderTableViewCell *headerCell = [self.tableView dequeueReusableCellWithIdentifier:@"MenuHeaderCell"];
        return headerCell;
    }
    
    else if (indexPath.row == 1){
        
        JJWMenuCircleTableViewCell *circleCell = [self.tableView dequeueReusableCellWithIdentifier:@"MenuCircleCell"];
        return circleCell;
    }
    else{
        JJWMenuTableViewCell *menuCell = [self.tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
        menuCell.cellLabel.text = [self.menuItems objectAtIndex:indexPath.row-2];
        return menuCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        
        return 150;
    }
    else if (indexPath.row == 1){
        
        return 220;
    }
    else{
        
        return 60;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count]+2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *childViewContollers = [self childViewControllers];
    UIViewController *currentTopViewController = childViewContollers[0];
   
    for (int i = 0; i < 5; i++){
        
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i + 2 inSection:0]];
        selectedCell.cellLabel.textColor = Gray_Color;
    }
    if (indexPath.row == 2){
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        selectedCell.cellLabel.textColor = Yellow_Color;
        
        JJWTodayViewController *vc = [[JJWTodayViewController alloc] init];
        JJWTodayNavigationController *nvc = [[JJWTodayNavigationController alloc] initWithRootViewController:vc];
        vc.delegate = self;
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else if (indexPath.row == 3) {
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        selectedCell.cellLabel.textColor = Blue_Color;
        
        JJWHabitsViewController *vc = [[JJWHabitsViewController alloc] init];
        JJWHabitsNavigationController *nvc = [[JJWHabitsNavigationController alloc] initWithRootViewController:vc];         
        vc.delegate = self;
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else if (indexPath.row == 4) {
        
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        selectedCell.cellLabel.textColor = Green_Color;
        
        JJWTodayViewController *vc = [[JJWTodayViewController alloc] init];
        JJWTodayNavigationController *nvc = [[JJWTodayNavigationController alloc] initWithRootViewController:vc];
        vc.delegate = self;
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else if (indexPath.row == 5) {
        
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        selectedCell.cellLabel.textColor = Red_Color;
        
        JJWTodayViewController *vc = [[JJWTodayViewController alloc] init];
        JJWTodayNavigationController *nvc = [[JJWTodayNavigationController alloc] initWithRootViewController:vc];
        vc.delegate = self;
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else{
        JJWMenuTableViewCell *selectedCell = (JJWMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        selectedCell.cellLabel.textColor = Red_Color;
        
        JJWTodayViewController *vc = [[JJWTodayViewController alloc] init];
        vc.delegate = self;
        JJWTodayNavigationController *nvc = [[JJWTodayNavigationController alloc] initWithRootViewController:vc];
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    
    for (UIViewController *v in childViewContollers){
        [v.view removeFromSuperview];
        [v removeFromParentViewController];
    }
    
    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:7 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseOut animations:^
     {
        self.containerView.center = CGPointMake((self.containerView.window.frame.size.width/2), self.containerView.center.y);
     }
    completion:nil];
}


#pragma mark JJWMainViewControler Delegate Methods

- (void)didDragWithMovment:(int)movement
{
    self.containerView.center = CGPointMake(self.containerView.center.x + movement, self.containerView.center.y);
    if (self.containerView.center.x > (self.containerView.window.frame.size.width/2) + 250){
        self.containerView.center = CGPointMake((self.containerView.window.frame.size.width/2) + 250, self.containerView.window.center.y);
    }
    else if (self.containerView.center.x < (self.containerView.window.frame.size.width/2)){
        self.containerView.center = CGPointMake((self.containerView.window.frame.size.width/2), self.containerView.window.center.y);
    }
}

- (void)animateMenu
{
    int move;
    if (self.containerView.frame.origin.x > 100){
        move = 245;
    }
    else{
        move = 0;
    }

    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:7 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseOut animations:^
    {
        self.containerView.center = CGPointMake((self.containerView.window.frame.size.width/2)+move, self.containerView.center.y);
    }
    completion:nil];
}

- (void)animateMenuReverse
{
    int move;
    if (self.containerView.frame.origin.x > 100){
        move = 0;
    }
    else{
        move = 245;
    }

    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:7 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseOut animations:^
    {
       self.containerView.center = CGPointMake((self.containerView.window.frame.size.width/2)+move, self.containerView.center.y);
    }
    completion:nil];
}

@end
