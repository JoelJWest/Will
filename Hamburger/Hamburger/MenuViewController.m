//
//  MenuViewController.m
//  Hamburger
//
//  Created by Joel West on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "MenuViewController.h"
#import "View1ViewController.h"
#import "View2ViewController.h"
#import "View3ViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *container;
@property IBOutlet UITableView *tableView;
@property NSArray *menuItems;
@end

@implementation MenuViewController


-(instancetype)initFirstTime{
    
    self = [super initWithNibName:@"MenuViewController" bundle:[NSBundle mainBundle]];
    if (self){
        [[NSBundle mainBundle] loadNibNamed:@"MenuViewController" owner:self options:nil];
        View1ViewController *vc = [[View1ViewController alloc] init];
        vc.view.frame = self.container.frame;
        
        [self addChildViewController:vc];
        [self.container addSubview:vc.view];
        
        self.menuItems = @[@"One",@"Two",@"Three"];
    }
    return  self;
}


-(void)move{
    
    int move;
    if (self.container.frame.origin.x > 10){
        move = -250;
    }
    else{
        move = 250;
    }
    
   [UIView animateWithDuration:.3 animations:^{
    self.container.center = CGPointMake(self.container.center.x + move, self.container.center.y);
   }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   NSArray *childViewContollers = [self childViewControllers];
   UIViewController *tvc = childViewContollers[0];
    
    if (indexPath.row == 0){
        View1ViewController *vc = [[View1ViewController alloc] init];
        vc.view.frame = self.container.window.frame;
        [tvc.view removeFromSuperview];
        [tvc removeFromParentViewController];
        [self addChildViewController:vc];
        [self.container addSubview:vc.view];
   
    }
    else if (indexPath.row == 1) {
        
        View2ViewController *vc = [[View2ViewController alloc] init];
        vc.view.frame = self.container.window.frame;
        [tvc.view removeFromSuperview];
        [tvc removeFromParentViewController];
        [self addChildViewController:vc];
        [self.container addSubview:vc.view];
    }
    else{
        
        View3ViewController *vc = [[View3ViewController alloc] init];
        vc.view.frame = self.container.window.frame;
        [tvc.view removeFromSuperview];
        [tvc removeFromParentViewController];
        [self addChildViewController:vc];
        [self.container addSubview:vc.view];
    }
    
    for (UIViewController *v in childViewContollers){
        [v.view removeFromSuperview];
        [v removeFromParentViewController];
       
    }
    
    
}

@end
