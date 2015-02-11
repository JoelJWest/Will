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
@end

@interface JJWHabitCardTableViewCell : UITableViewCell

@property (nonatomic) IBOutlet UIView *cardBackground;
@property (nonatomic) IBOutlet UIView *cardBackgroundEdit;
@property (nonatomic) NSIndexPath *cellIndex;
@property id <JJWHabitCardTableViewCellDelegate> delegate;
@end
