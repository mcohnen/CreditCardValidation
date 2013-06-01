//
//  MCFormModel.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormModel.h"
#import "MCFormCell.h"

@implementation MCFormModel

- (id)cellClass {
    if (!_cellClass) {
        _cellClass = [MCFormCell class];
    }
    return _cellClass;
}

- (NSString *)reuseId {
    return NSStringFromClass(self.cellClass);
}

@end
