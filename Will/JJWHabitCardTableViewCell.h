//
//  JJWHabitCardTableViewCell.h
//  Will
//
//  Created by Joel J. West on 2/10/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JJWHabitCardTableViewCellDelegate <NSObject>
- (void)didPressEditButtonOnCardAt:(NSIndexPath *)indexPath;
- (void)didPressSaveButtonOnCardAt:(NSIndexPath *)indexPath;
@end

@interface JJWHabitCardTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic) IBOutlet UIView *cardBackground;
@property (nonatomic) IBOutlet UIView *mainView;
@property (nonatomic) IBOutlet UIView *editView;

@property (nonatomic) IBOutlet UITextField *textField; 
@property (nonatomic) NSIndexPath *cellIndex;

@property id <JJWHabitCardTableViewCellDelegate> delegate;

- (IBAction)sundayButtonTouchUpInside:(id)sender;
- (IBAction)mondayButtonTouchUpInside:(id)sender;
- (IBAction)tuesdayButtonTouchUpInside:(id)sender;
- (IBAction)wednesdayButtonTouchUpInside:(id)sender;
- (IBAction)thursdayButtonTouchUpInside:(id)sender;
- (IBAction)fridayButtonTouchUpInside:(id)sender;
- (IBAction)saturdayButtonTouchUpInside:(id)sender;

@end
