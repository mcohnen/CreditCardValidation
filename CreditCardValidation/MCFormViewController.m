//
//  MFormViewController.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormViewController.h"
#import "MCFormEditCell.h"

@interface MCFormViewController ()

@end

@implementation MCFormViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        _modelGroups = [[NSMutableArray alloc] init];
    }
    return self;
}

- (MCFormModelGroup *)groupAtSection:(NSInteger)section {
    if (section >= _modelGroups.count) {
        return nil;
    }
    return _modelGroups[section];
}

- (MCFormModel *)modelAtIndexPath:(NSIndexPath *)indexPath {
    MCFormModelGroup *group = [self groupAtSection:indexPath.section];
    if (group && indexPath.row < group.models.count) {
        return group.models[indexPath.row];
    }
    return nil;
}

- (void)addModelGroup:(MCFormModelGroup *)group {
    [_modelGroups addObject:group];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _modelGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self groupAtSection:section].models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCFormModel *model = [self modelAtIndexPath:indexPath];
    MCFormCell *cell = [tableView dequeueReusableCellWithIdentifier:model.reuseID];
    if (!cell) {
        cell = [[model.cellClass alloc] initWithReuseIdentifier:model.reuseID];
    }
    
    model.formVC = self;
    [cell prepareForModel:model];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.canBecomeFirstResponder) {
        [cell becomeFirstResponder];
    }
}

@end
