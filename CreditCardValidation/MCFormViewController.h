//
//  MFormViewController.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormModelGroup.h"
#import "MCFormModel.h"
#import "MCFormCell.h"

@interface MCFormViewController : UITableViewController {
    NSMutableArray *_modelGroups;
}

- (void)addModelGroup:(MCFormModelGroup *)group;

@end
