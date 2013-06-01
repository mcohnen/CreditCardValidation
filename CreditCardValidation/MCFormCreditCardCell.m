//
//  MCFormCreditCardCell.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormCreditCardCell.h"
#import "MCFormCreditCardModel.h"

@implementation MCFormCreditCardCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _vfkImageView = [[UIImageView alloc] initWithImage:[MCFormCreditCardType VDKDefaultImage]];
        [self.contentView addSubview:_vfkImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _vfkImageView.origin = CGPointMake(self.contentView.width - _vfkImageView.width -self.padding, self.padding);
    
    self.textField.width = _vfkImageView.left - 2*self.padding;
}

@end
