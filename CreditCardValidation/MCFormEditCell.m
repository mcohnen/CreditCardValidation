//
//  CCVEditCell.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormEditCell.h"
#import "MCFormEditModel.h"

@implementation MCFormEditCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.padding = 10;
        _textField = [[UITextField alloc] init];
        _textField.height = 25;
        [self.contentView addSubview:_textField];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)becomeFirstResponder {
    return [_textField becomeFirstResponder];
}

- (void)markValid:(BOOL)valid {
    if (valid) {
        _textField.textColor = [UIColor blackColor];
    } else {
        _textField.textColor = [UIColor redColor];
    }
}

- (void)prepareForModel:(MCFormEditModel *)model {
    [super prepareForModel:model];
    
    _textField.text = model.text;
    _textField.placeholder = model.placeholder;
    _textField.autocapitalizationType = model.autocapitalizationType;
    _textField.keyboardType = model.keyboardType;
    _textField.returnKeyType = model.returnKeyType;
    
    _textField.delegate = model;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textField.width = self.contentView.width -2*self.padding;
    [_textField centerHV];
}

@end