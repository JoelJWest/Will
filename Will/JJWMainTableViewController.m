//
//  JJWMainTableViewController.m
//  Will
//
//  Created by Joel West on 1/25/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMainTableViewController.h"
#import "JJWMainTableViewDataSource.h"
#import "JJWMenuViewController.h"

@interface JJWMainTableViewController ()
@property (nonatomic) JJWMainTableViewDataSource *dataSource;
@property (weak) JJWMenuViewController *parentView;
@end

@implementation JJWMainTableViewController

# pragma mark Set Up Methods

-(void)viewDidLoad{
    
    [self setUpTableView];
    [self setUpNavigationBar];
 
}


-(void)setUpTableView{
    self.tableView.delegate = self;
    self.dataSource = [[JJWMainTableViewDataSource alloc] initWithTableView:self.tableView];
}

-(void)setUpNavigationBar{
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuButtonPressed)];
    self.navigationItem.leftBarButtonItem = menuButton;
}

-(void)menuButtonPressed{

    self.parentView = (JJWMenuViewController *) self.navigationController.parentViewController;
    [self.parentView moveMenuAnimation];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}



@end
