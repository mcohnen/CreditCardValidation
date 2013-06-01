//
//  MCFormCreditCardModel.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormCreditCardModel.h"
#import "MCFormCreditCardCell.h"

// Regex used from http://www.regular-expressions.info/creditcard.html
NSString *const REGEX_VISA = @"^4[0-9]{12}(?:[0-9]{3})?$";
NSString *const REGEX_MASTERCARD = @"^5[1-5][0-9]{14}$";
NSString *const REGEX_AMEX= @"^3[47][0-9]{13}$";
NSString *const REGEX_DINERSCLUB = @"^3(?:0[0-5]|[68][0-9])[0-9]{11}$";
NSString *const REGEX_DISCOVER = @"^6(?:011|5[0-9]{2})[0-9]{12}$";
NSString *const REGEX_JCB = @"^(?:2131|1800|35\\d{3})\\d{11}$";

@implementation MCFormCreditCardModel

- (id)init {
    if (self = [super init]) {
        self.cellClass = [MCFormCreditCardCell class];
        self.keyboardType = UIKeyboardTypeNumberPad;
        self.placeholder = @"Number";
        self.maxAllowedLength = 16;
        self.creditCardTypes = @[
                                 [[MCFormCreditCardType alloc] initWithName:@"Visa" regex:REGEX_VISA],
                                 [[MCFormCreditCardType alloc] initWithName:@"Mastercard" regex:REGEX_MASTERCARD],
                                 [[MCFormCreditCardType alloc] initWithName:@"Amex" regex:REGEX_AMEX],
                                 [[MCFormCreditCardType alloc] initWithName:@"DinersClub" regex:REGEX_DINERSCLUB],
                                 [[MCFormCreditCardType alloc] initWithName:@"Discover" regex:REGEX_DISCOVER],
                                 [[MCFormCreditCardType alloc] initWithName:@"JCB" regex:REGEX_JCB]];
        [self setCreditCardValidateBlock];
    }
    return self;
}

- (MCFormCreditCardCell *)creditCardCell {
    return (MCFormCreditCardCell *)self.cell;
}

- (void)notifyTypeChange:(MCFormCreditCardType *)type {
    if (!type) {
        [self creditCardCell].vfkImageView.image = [MCFormCreditCardType VDKDefaultImage];
    } else {
        [self creditCardCell].vfkImageView.image = type.VDKImage;
    }
    if (self.typeChangedBlock) {
        self.typeChangedBlock(self, self.formVC, type);
    }
}

- (void)markValid:(BOOL)valid textField:(UITextField *)textField typing:(BOOL)typing {
    if (typing) {
        // Nothing, do not mark red for credit cards
    } else {
        [super markValid:valid textField:textField typing:typing];
    }
}

- (void)setCreditCardValidateBlock {
    __weak MCFormCreditCardModel *weakSelf = self;
    [self setValidateBlock:^BOOL(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        for (MCFormCreditCardType *type in weakSelf.creditCardTypes) {
            if ([type isValidNumber:text]) {
                [weakSelf notifyTypeChange:type];
                return YES;
            }
        }
        [weakSelf notifyTypeChange:nil];
        return NO;
    }];
}

@end

@implementation MCFormCreditCardType

- (id)initWithName:(NSString *)name regex:(NSString *)regex {
    if (self = [super init]) {
        _name = name;
        _regex = regex;
    }
    return self;
}

- (BOOL)isValidNumber:(NSString *)number {
    return [MCFormEditModel validateText:number regex:_regex];
}

+ (UIImage *)VDKDefaultImage {
    return [UIImage imageNamed:@"images/vdk/VDKGenericCard"];
}

- (UIImage *)VDKImage {
    return [UIImage imageNamed:[NSString stringWithFormat:@"images/vdk/VDK%@", _name]];
}

@end
