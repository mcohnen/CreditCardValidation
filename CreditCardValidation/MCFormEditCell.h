//
//  CCVEditCell.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCFormCell.h"

@interface MCFormEditCell : MCFormCell {
}

@property (nonatomic, readonly) UITextField *textField;

- (void)markValid:(BOOL)valid;

@end
