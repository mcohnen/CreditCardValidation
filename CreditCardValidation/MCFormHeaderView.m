//
//  MCFormHeaderView.m
//  CreditCardValidation
//
//  Created by Miguel Cohnen on 6/1/13.
//  Copyright (c) 2013 Miguel Cohnen. All rights reserved.
//

#import "MCFormHeaderView.h"
#import "MCFormModelGroup.h"

@implementation MCFormHeaderView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor whiteColor];
        self.height = [self.class viewHeight];
    }
    return self;
}

+ (float)viewHeight {
    return 44;
}

- (void)prepareForGroup:(MCFormModelGroup *)group {
    self.textLabel.text = group.title;
}



@end
