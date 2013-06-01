//
//  MCFormModelGroup.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormModelGroup.h"

@implementation MCFormModelGroup

- (void)addModel:(MCFormModel *)model {
    if (!_models) {
        _models = [[NSMutableArray alloc] init];
    }
    [self.models addObject:model];
}

@end
