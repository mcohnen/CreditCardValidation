//
//  MCFormEditModel.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCFormModel.h"

@class MCFormEditModel;

typedef enum {
    MCFormValidatePreventWrong,
    MCFormValidateAllowWrong,
} MCFormValidateStyle;

typedef BOOL (^MCFormValidateBlock)(MCFormEditModel *model, MCFormViewController *formVC, NSString *text);
typedef void (^MCFormTextChangedBlock)(MCFormEditModel *model, MCFormViewController *formVC, NSString *text);
typedef BOOL (^MCFormShouldReturnBlock)(MCFormEditModel *model, MCFormViewController *formVC);

@interface MCFormEditModel : MCFormModel <UITextFieldDelegate>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, assign) NSInteger maxAllowedLength;

@property (nonatomic, assign) MCFormValidateStyle validateStyle;

@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) UIReturnKeyType returnKeyType;
@property (nonatomic, assign) UITextAutocorrectionType autocorrectionType;
@property (nonatomic, assign) UITextAutocapitalizationType autocapitalizationType;

@property (nonatomic, copy) MCFormValidateBlock validateBlock;
@property (nonatomic, copy) MCFormTextChangedBlock changedBlock;
@property (nonatomic, copy) MCFormShouldReturnBlock returnBlock;

+ (BOOL)validateText:(NSString *)text regex:(NSString *)regexStr;

- (void)setValidateWithRegexStr:(NSString *)regexStr;
- (void)markValid:(BOOL)valid textField:(UITextField *)textField typing:(BOOL)typing;

- (void)setValidateBlock:(MCFormValidateBlock)validateBlock;
- (void)setChangedBlock:(MCFormTextChangedBlock)changedBlock;
- (void)setReturnBlock:(MCFormShouldReturnBlock)returnBlock;

@end
