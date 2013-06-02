//
//  MCFormEditModel.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormEditModel.h"
#import "MCFormEditCell.h"

@implementation MCFormEditModel

- (id)init {
    if (self = [super init]) {
        self.cellClass = [MCFormEditCell class];
    }
    return self;
}

- (void)setValidateWithRegexStr:(NSString *)regexStr {
    [self setValidateBlock:^BOOL(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        return [MCFormEditModel validateText:text regex:regexStr];
    }];
}

+ (BOOL)validateText:(NSString *)text regex:(NSString *)regexStr {
    NSError  *error  = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:regexStr
                                  options:0
                                  error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:text options:0 range:NSMakeRange(0, [text length])];
    return match != nil;
}

- (BOOL)validateString:(NSString *)string {
    if (self.validateBlock) {
        return self.validateBlock(self, self.formVC, string);
    }
    return YES;
}

- (void)textChanged:(NSString *)text {
    if (self.changedBlock) {
        self.changedBlock(self, self.formVC, text);
    }
}

- (void)markValid:(BOOL)valid textField:(UITextField *)textField typing:(BOOL)typing {
    MCFormEditCell *cell = [textField findFirstAncestorKindOf:[MCFormEditCell class]];
    [cell markValid:valid];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (self.maxAllowedLength > 0 && newText.length > self.maxAllowedLength) {
        return NO;
    }
    
    BOOL isValid = [self validateString:newText];
    
    
    if (!isValid && self.validateStyle & MCFormValidatePreventWrong) {
        return false;
    }
    
    [self markValid:isValid textField:textField typing:YES];
    [self textChanged:newText];
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.returnBlock) {
        return self.returnBlock(self, self.formVC);
    }
    return YES;
}


@end
