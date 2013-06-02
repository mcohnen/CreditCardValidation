//
//  CCVViewController.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "CCVViewController.h"
#import "MCFormEditModel.h"
#import "MCFormCreditCardModel.h"
#import "MCFormSubmitModel.h"
#import "MCFormHeaderView.h"

@interface CCVViewController ()

@end

@implementation CCVViewController

- (id)init {
    if (self = [super init]) {
        self.creditCard = [[CreditCard alloc] init];
        [self createModels];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundView = nil;
    self.view.backgroundColor = [UIColor colorWithRed:.12 green:.12 blue:.12 alpha:1];
}

- (void)validateCard {
    NSArray *errors = [self.creditCard validate];
    if (errors.count > 0) {
        NSString *msg = [errors componentsJoinedByString:@"\n"];
        [[[UIAlertView alloc] initWithTitle:@"Oops! Credit card it not valid" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil] show];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Ready to spend your $$$ ;)" delegate:nil cancelButtonTitle:@"Proceed" otherButtonTitles: nil] show];
        // Hide KB
        [[UIView findFirstResponder:self.view] resignFirstResponder];
    }
}

// Create Models

- (int)currentYear {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    return [components year]%100;
}

- (void)createModels {
    MCFormModelGroup *group = [[MCFormModelGroup alloc] init];
    group.title = @"Add a new card:";
    group.cellClass = [MCFormHeaderView class];
    [self addModelGroup:group];
    
    [group addModel:[self numberModel:self.creditCard]];
    
    [group addModel:[self monthModel:self.creditCard]];
    
    [group addModel:[self yearModel:self.creditCard]];
    
    [group addModel:[self ccvModel:self.creditCard]];
    
    [group addModel:[self zipCodeModel:self.creditCard]];
    
    [group addModel:[self submitModel:self.creditCard]];
}

- (MCFormModel *)numberModel:(__weak CreditCard *)creditCard {
    MCFormCreditCardModel *number = [[MCFormCreditCardModel alloc] init];
    [number setChangedBlock:^void(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        creditCard.number = text;
    }];
    return number;
}

- (MCFormModel *)monthModel:(__weak CreditCard *)creditCard {
    MCFormEditModel *month = [[MCFormEditModel alloc] init];
    month.keyboardType = UIKeyboardTypeNumberPad;
    month.placeholder = @"Expiration Month (2 digits)";
    month.maxAllowedLength = 2;
    [month setChangedBlock:^void(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        creditCard.expirationMonth = text;
    }];
    [month setValidateBlock:^BOOL(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        int month = [text intValue];
        return month >= 0 && month <= 12;
    }];
    return month;
}

- (MCFormModel *)yearModel:(__weak CreditCard *)creditCard {
    MCFormEditModel *year = [[MCFormEditModel alloc] init];
    year.keyboardType = UIKeyboardTypeNumberPad;
    year.placeholder = @"Expiration Year (2 digits)";
    int currYear = [self currentYear];
    [year setChangedBlock:^void(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        creditCard.expirationYear = text;
    }];
    [year setValidateBlock:^BOOL(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        int year = [text intValue];
        return year >= currYear;
    }];
    year.maxAllowedLength = 2;
    return year;
}

- (MCFormModel *)ccvModel:(__weak CreditCard *)creditCard {
    MCFormEditModel *ccv = [[MCFormEditModel alloc] init];
    ccv.keyboardType = UIKeyboardTypeNumberPad;
    ccv.placeholder = @"CCV";
    ccv.validateStyle = MCFormValidatePreventWrong;
    // Amex has 4 numbers in CCV
    ccv.maxAllowedLength = 4;
    [ccv setChangedBlock:^void(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        creditCard.ccv = text;
    }];
    return ccv;
}

- (MCFormModel *)zipCodeModel:(__weak CreditCard *)creditCard {
    MCFormEditModel *zipCode = [[MCFormEditModel alloc] init];
    // Zip codes can contain letters and symbols in different countries
    zipCode.keyboardType = UIKeyboardTypeDefault;
    zipCode.placeholder = @"Zip code";
    zipCode.returnKeyType = UIReturnKeyDone;
    [zipCode setReturnBlock:^BOOL(MCFormEditModel *model, MCFormViewController *formVC) {
        [(CCVViewController *)formVC validateCard];
        return YES;
    }];
    [zipCode setChangedBlock:^void(MCFormEditModel *model, MCFormViewController *formVC, NSString *text) {
        creditCard.zipCode = text;
    }];
    return zipCode;
}

- (MCFormModel *)submitModel:(__weak CreditCard *)creditCard {
    MCFormSubmitModel *submit = [[MCFormSubmitModel alloc] init];
    [submit setSubmitBlock:^(MCFormSubmitModel *model, MCFormViewController *formVC) {
        [(CCVViewController *)formVC validateCard];
    }];
    submit.buttonTitle = @"Submit";
    return submit;
}

@end
