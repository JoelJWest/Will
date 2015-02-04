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

@end

@implementation JJWMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(menuAction)];
    self.navigationItem.leftBarButtonItem = menuButton;
}

-(void)menuAction{
    
    JJWMenuViewController *parentViewContoller = (JJWMenuViewController *)[self.navigationController parentViewController];
    [parentViewContoller menuAnimation];
    
}

@end
