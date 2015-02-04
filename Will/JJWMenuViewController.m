//
//  JJWMenuViewController.m
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMenuViewController.h"
#import "JJWMenuTableViewCell.h"
#import "JJWHeaderMenuTableViewCell.h"
#import "JJWMainNavigationController.h"
#import "JJWMainViewController.h"
#import "JJWDietNavigationController.h"
#import "JJWDietViewController.h"

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

-(void)setUpTableView{
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UINib *menuTableViewNib = [UINib nibWithNibName:@"JJWMenuTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:menuTableViewNib forCellReuseIdentifier:@"MenuCell"];
    UINib *headerMenuTableViewNib = [UINib nibWithNibName:@"JJWHeaderMenuTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:headerMenuTableViewNib forCellReuseIdentifier:@"HeaderMenuCell"];
}

-(void)setUpMenuItems{
    
    self.menuItems = @[@"Today",@"Habits",@"Meals",@"Workouts",@"Settings"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        JJWHeaderMenuTableViewCell *headerCell = [self.tableView dequeueReusableCellWithIdentifier:@"HeaderMenuCell"];
        headerCell.percentageCompleteLabel.text = @"64%";
        headerCell.userInteractionEnabled = NO;
        return headerCell;
        
    }
    JJWMenuTableViewCell *menuCell = [self.tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    menuCell.cellLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    return menuCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        return 200;
    }
    else{
        
        return 60;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.menuItems count];
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
        move = -(self.view.frame.size.width/20)*13;
    }
    else{
        move = (self.view.frame.size.width/20)*13;
    }
    
    [UIView animateWithDuration:.3 animations:^{
        self.containerView.center = CGPointMake(self.containerView.center.x + move, self.containerView.center.y);
    }];
}
@end
