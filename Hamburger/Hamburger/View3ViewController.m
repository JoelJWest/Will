//
//  View3ViewController.m
//  Hamburger
//
//  Created by Joel West on 2/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "View3ViewController.h"
#import "MenuViewController.h"

@interface View3ViewController ()

@end

@implementation View3ViewController

- (IBAction)buttonPressed:(id)sender {
    
    MenuViewController *parentView = (MenuViewController *)[self parentViewController];
    [parentView move];
}


@end
