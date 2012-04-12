//
//  DateProvider.m
//  KiwiPersonDemo
//
//  Created by Michael Zornek on 4/12/12.
//  Copyright (c) 2012 Clickable Bliss. All rights reserved.
//

#import "DateProvider.h"

@implementation DateProvider

@synthesize staticNowDate=_staticNowDate;

- (NSDate *)date
{
    if (self.staticNowDate) {
        return self.staticNowDate;
    } else {
        return [NSDate date];
    }
}

@end
