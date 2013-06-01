//
//  MCFormCreditCardModel.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormEditModel.h"

@class MCFormCreditCardType;

typedef void (^MCFormCreditCardTypeBlock)(MCFormEditModel *model, MCFormViewController *formVC, MCFormCreditCardType *type);

@interface MCFormCreditCardModel : MCFormEditModel {
}

@property (nonatomic, strong) NSArray *creditCardTypes;
@property (nonatomic, copy) MCFormCreditCardTypeBlock typeChangedBlock;

- (void)setTypeChangedBlock:(MCFormCreditCardTypeBlock)typeChangedBlock;

@end

@interface MCFormCreditCardType : NSObject {

}

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *regex;
@property (nonatomic, readonly) UIImage *VDKImage;

+ (UIImage *)VDKDefaultImage;

- (id)initWithName:(NSString *)name regex:(NSString *)regex;
- (BOOL)isValidNumber:(NSString *)number;

@end
