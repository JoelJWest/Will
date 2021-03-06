//
//  JJWMainViewController.h
//  Will
//
//  Created by Joel J. West on 2/2/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JJWTodayViewControllerDelegate <NSObject>
-(void)didDragWithMovment:(int)movement;
-(void)animateMenu;
-(void)animateMenuReverse;
@end

@interface JJWTodayViewController : UIViewController
@property id <JJWTodayViewControllerDelegate> delegate;
@end
