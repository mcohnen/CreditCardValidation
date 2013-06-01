//
//  MCFormCell.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCFormModel;

@interface MCFormCell : UITableViewCell

@property (nonatomic, assign) float padding;
@property (nonatomic, weak) MCFormModel *model;

- (void)prepareForModel:(MCFormModel *)model;
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
