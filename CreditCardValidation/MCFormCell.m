//
//  MCFormCell.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormCell.h"
#import "MCFormModel.h"

@implementation MCFormCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.padding = 10;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)prepareForModel:(MCFormModel *)model {
    self.model = model;
    model.cell = self;
}


@end
