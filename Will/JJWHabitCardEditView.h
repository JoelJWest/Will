//
//  JJWHabitCardEditView.h
//  Will
//
//  Created by Joel J. West on 2/11/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJWHabitCardEditView : UIView

@property (nonatomic) IBOutlet UIButton *sundayButton;
@property (nonatomic) IBOutlet UIButton *mondayButton;
@property (nonatomic) IBOutlet UIButton *tuesdayButton;
@property (nonatomic) IBOutlet UIButton *wednesdayButton;
@property (nonatomic) IBOutlet UIButton *thursdayButton;
@property (nonatomic) IBOutlet UIButton *fridayButton;
@property (nonatomic) IBOutlet UIButton *saturdayButton;

+ (instancetype)viewFromNib;

@end
