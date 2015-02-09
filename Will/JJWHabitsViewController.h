//
//  JJWHabitsViewController.h
//  Will
//
//  Created by Joel J. West on 2/9/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JJWHabitsViewControllerDelegate <NSObject>
-(void)didDragWithMovment:(int)movement;
-(void)animateMenu;
-(void)animateMenuReverse;
@end

@interface JJWHabitsViewController : UIViewController
@property id <JJWHabitsViewControllerDelegate> delegate;
@end
