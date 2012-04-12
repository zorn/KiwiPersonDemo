//
//  Person.m
//  KiwiPersonDemo
//
//  Created by Michael Zornek on 4/12/12.
//  Copyright (c) 2012 Clickable Bliss. All rights reserved.
//

#import "Person.h"
#import "DateProvider.h"

@implementation Person

@synthesize firstName=_firstName;
@synthesize lastName=_lastName;
@synthesize enjoysTesting=_enjoysTesting;
@synthesize birthdate=_birthdate;
@synthesize dateProvider=_dateProvider;

- (id)init
{
    self = [super init];
    if (self) {
        self.enjoysTesting = YES;
        // FIXME: Should inherit a default shared date provide by default and allow customization of the dateProvider via accessors for special cases.
        // self.dateProvider = [DateProvider sharedDateProvider];
    }
    return self;
}

- (NSInteger)yearsOld
{
    if (!self.dateProvider) {
        NSLog(@"warning: returning 0 for -[Person yearsOld] because Person could not find a DateProvider");
        return -1;
    } else if (!self.birthdate) {
        NSLog(@"warning: returning 0 for -[Person yearsOld] because Person did not have a birthdate");
        return -1;
    } else {
        NSDate *now = [self.dateProvider date];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger unitFlags = NSYearCalendarUnit;
        NSDateComponents *components = [gregorian components:unitFlags fromDate:self.birthdate toDate:now options:0];
        NSLog(@"components %@", components);
        NSInteger answer = [components year];
        return answer;
    }    
}

- (NSString *)displayName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
