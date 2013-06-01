//
//  MCFormModel.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCFormViewController;
@class MCFormCell;

@interface MCFormModel : NSObject

@property (nonatomic, copy) Class cellClass;
@property (nonatomic, weak) MCFormViewController *formVC;
@property (nonatomic, weak) MCFormCell *cell;
@property (nonatomic, readonly) NSString *reuseID;

@end
