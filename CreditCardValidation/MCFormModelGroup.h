//
//  MCFormModelGroup.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCFormModel.h"

@interface MCFormModelGroup : NSObject

@property (nonatomic, strong) NSMutableArray *models;
@property (nonatomic, copy) NSString *title;

- (void)addModel:(MCFormModel *)model;

@end
