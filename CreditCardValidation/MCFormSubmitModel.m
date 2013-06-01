//
//  MCFormSubmitModel.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormSubmitModel.h"
#import "MCformSubmitCell.h"

@implementation MCFormSubmitModel

- (id)init {
    if (self = [super init]) {
        self.cellClass = [MCFormSubmitCell class];
    }
    return self;
}

@end
