//
//  JJWMenuViewController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMenuViewController.h"
#import "JJWMenuTableViewCell.h"
#import "JJWMenuHeaderTableViewCell.h"
#import "JJWMenuCircleTableViewCell.h"
#import "JJWMainNavigationController.h"
#import "JJWMainViewController.h"
#import "JJWDietNavigationController.h"
#import "JJWDietViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface JJWMenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *menuItems;
@property (nonatomic) IBOutlet UIView *containerView;
@end

@implementation JJWMenuViewController

-(instancetype)initFirstTime{
    
    self = [super init];
    if (self){
        
        [[NSBundle mainBundle] loadNibNamed:@"JJWMenuViewController" owner:self options:nil];
        [self setUpMenuItems];
        [self setUpTableView];
        [self addTopViewController];
    
    }
    return self;
}

-(instancetype)init{
    
    self = [super init];
    if (self){
        
        
      
    }
    return self;
}

-(void)addTopViewController{
    
    JJWMainViewController *homeViewController = [[JJWMainViewController alloc] init];
    JJWMainNavigationController *homeNavContoller = [[JJWMainNavigationController alloc] initWithRootViewController:homeViewController];
    
    homeNavContoller.view.frame = self.containerView.frame;
    [self addChildViewController:homeNavContoller];
    [self.containerView addSubview:homeNavContoller.view];
    
}

-(void)setUpTableView
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UINib *menuTableViewNib = [UINib nibWithNibName:@"JJWMenuTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuTableViewNib forCellReuseIdentifier:@"MenuCell"];
    UINib *menuHeaderTableViewNib = [UINib nibWithNibName:@"JJWMenuHeaderTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuHeaderTableViewNib forCellReuseIdentifier:@"MenuHeaderCell"];
    UINib *menuCircleTableViewNib = [UINib nibWithNibName:@"JJWMenuCircleTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuCircleTableViewNib forCellReuseIdentifier:@"MenuCircleCell"];
    
    
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.tableView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[UIColor colorWithRed:0.185447 green:0.185442 blue:0.185445 alpha:1].CGColor, (id)[[UIColor whiteColor] CGColor], nil];
   
    
    UIView *tableBackgroundView = [[UIView alloc] init];
    tableBackgroundView.bounds = CGRectMake(self.tableView.bounds.origin.x, self.tableView.bounds.origin.y, self.tableView.bounds.size.width, self.view.window.frame.size.height);
    [tableBackgroundView.layer insertSublayer:gradient atIndex:0];
 
    [self.tableView setBackgroundView:tableBackgroundView];
}

-(void)setUpMenuItems{
    
    self.menuItems = @[@"Today",@"Habits",@"Meals",@"Workouts",@"Settings"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.menuItems count]+2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *childViewContollers = [self childViewControllers];
    UIViewController *currentTopViewController = childViewContollers[0];
   
    if (indexPath.row == 0){
        JJWMainViewController *vc = [[JJWMainViewController alloc] init];
        JJWMainNavigationController *nvc = [[JJWMainNavigationController alloc] initWithRootViewController:vc];
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
        
    }
    else if (indexPath.row == 1) {
        
        JJWMainViewController *vc = [[JJWMainViewController alloc] init];
        JJWMainNavigationController *nvc = [[JJWMainNavigationController alloc] initWithRootViewController:vc];
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else if (indexPath.row == 2) {
        
        JJWDietViewController *vc = [[JJWDietViewController alloc] init];
        JJWMainNavigationController *nvc = [[JJWMainNavigationController alloc] initWithRootViewController:vc];
        nvc.view.frame = self.containerView.window.frame;
        [currentTopViewController.view removeFromSuperview];
        [currentTopViewController removeFromParentViewController];
        [self addChildViewController:nvc];
        [self.containerView addSubview:nvc.view];
    }
    else{
        
        JJWMainViewController *vc = [[JJWMainViewController alloc] init];
        JJWMainNavigationController *nvc = [[JJWMainNavigationController alloc] initWithRootViewController:vc];
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
    
}

-(void)menuAnimation{
    
    int move;
    if (self.containerView.frame.origin.x > 10){
        move = -250;
    }
    else{
        move = 250;
    }
    
    [UIView animateWithDuration:.3 animations:^{
        self.containerView.center = CGPointMake(self.containerView.center.x + move, self.containerView.center.y);
    }];
}
@end
