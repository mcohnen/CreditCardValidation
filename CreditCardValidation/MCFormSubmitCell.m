//
//  MCFormSubmitCell.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormSubmitCell.h"
#import "MCFormSubmitModel.h"

@implementation MCFormSubmitCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.padding = 7;
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.height = 30;
        [_button addTarget:self action:@selector(submitPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
    }
    return self;
}

- (MCFormSubmitModel *)submitModel {
    return (MCFormSubmitModel *)self.model;
}

- (void)submitPressed {
    MCFormSubmitModel *model = [self submitModel];
    if ([self submitModel].submitBlock) {
        [self submitModel].submitBlock(model, model.formVC);
    }
}

- (void)prepareForModel:(MCFormSubmitModel *)model {
    [super prepareForModel:model];
    
    [_button setTitle:model.buttonTitle forState:UIControlStateNormal];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _button.width = self.contentView.width -2*self.padding;
    [_button centerHV];
}

@end
