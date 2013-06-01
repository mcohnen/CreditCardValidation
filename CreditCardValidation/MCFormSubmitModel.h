//
//  MCFormSubmitModel.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormModel.h"

@class MCFormViewController;
@class MCFormSubmitModel;

typedef void (^MCFormSubmitBlock)(MCFormSubmitModel *model, MCFormViewController *formVC);

@interface MCFormSubmitModel : MCFormModel

@property (nonatomic, copy) NSString *buttonTitle;

@property (nonatomic, copy) MCFormSubmitBlock submitBlock;

- (void)setSubmitBlock:(MCFormSubmitBlock)submitBlock;

@end
