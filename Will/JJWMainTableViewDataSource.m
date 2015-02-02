//
//  JJWMainTableViewDataSource.m
//  Will
//
//  Created by Joel West on 1/25/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "JJWMainTableViewDataSource.h"
#import "JJWTableViewCell.h"

@implementation JJWMainTableViewDataSource

-(instancetype)initWithTableView:(UITableView *)passedTableView{
    
    self = [super init];
    if (self){
        passedTableView.dataSource = self;
        self.tableView = passedTableView;
        UINib *cellNib = [UINib nibWithNibName:@"JJWTableViewCell" bundle:[NSBundle mainBundle]];
        [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JJWTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}


@end
