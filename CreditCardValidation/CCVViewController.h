//
//  CCVViewController.h
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 5/31/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCFormViewController.h"
#import "CreditCard.h"

@interface CCVViewController : MCFormViewController {
}

@property (nonatomic, strong) CreditCard *creditCard;

@end
