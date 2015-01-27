//
//  JJWMenuViewController.m
//  Will
//
//  Created by Joel West on 1/25/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMenuViewController.h"
#import "JJWMenuTableViewCell.h"
#import "TestViewController.h"
#import "JJWMainTableViewController.h"

@interface JJWMenuViewController ()
@property (strong, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) NSArray *menuItems;
@end

@implementation JJWMenuViewController

- (void)viewDidLoad {
   
    self.menuItems = @[@"Page 1", @"Page 2", @"Page 3", @"Page 4", @"Page 5",];
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    UINib *menuCellNib = [UINib nibWithNibName:@"JJWMenuTableViewCell" bundle:[NSBundle mainBundle]];
    [self.menuTableView registerNib:menuCellNib forCellReuseIdentifier:@"MenuCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveMenuAnimation) name:@"Menu" object:nil];
    JJWMainTableViewController *mainView = [[JJWMainTableViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainView];
    nav.view.window.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:nav];
    [self.view addSubview:nav.view];

    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.menuItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJWMenuTableViewCell *cell = [self.menuTableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    cell.cellLabel.text = self.menuItems[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *views = self.childViewControllers;
    UIViewController *topView = views[0];
    
    
    
    if (indexPath.row == 0){
    
        JJWMainTableViewController *mainView = [[JJWMainTableViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainView];
        nav.view.frame = topView.view.frame;
        [self addChildViewController:nav];
        [self.view addSubview:nav.view];

        
    }
    else{
        TestViewController *test = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:[NSBundle mainBundle]];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
        nav.view.frame = topView.view.frame;
        [self addChildViewController:nav];
        [self.view addSubview:nav.view];
      
        
    }
    
    NSArray *viewsToRemove = self.childViewControllers;
    
    for (UIViewController *v in viewsToRemove) {
        
        [v.view removeFromSuperview];
    }

    
    
}


-(void)moveMenuAnimation{
    NSArray *views = self.childViewControllers;
    UIViewController *topView = views[0];
    int move;
    
    if (topView.view.frame.origin.x > 10){
        move = 0;
    }
    else{
        move = 200;
    }
    
    [UIView animateWithDuration:.3 animations:^{
        topView.view.frame = CGRectMake(move, topView.view.frame.origin.y, topView.view.frame.size.width, topView.view.frame.size.height);
    }
    completion:NULL];
    
}

@end
