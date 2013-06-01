//
//  MCFormHeaderView.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCFormModelGroup;

#define kMCFormHeaderViewHeight 30

@interface MCFormHeaderView : UITableViewHeaderFooterView {
}

@property (nonatomic, assign) float padding;
@property (nonatomic, assign) UITextField *titleField;

+ (float)viewHeight;

- (void)prepareForGroup:(MCFormModelGroup *)group;

@end
