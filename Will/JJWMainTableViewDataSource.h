//
//  JJWMainTableViewDataSource.h
//  Will
//
//  Created by Joel West on 1/25/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JJWMainTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

-(instancetype)initWithTableView:(UITableView *)passedTableView;

@end
