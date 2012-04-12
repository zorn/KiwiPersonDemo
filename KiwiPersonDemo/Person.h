//
//  Person.h
//  KiwiPersonDemo
//
//  Created by Michael Zornek on 4/12/12.
//  Copyright (c) 2012 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DateProvider;

@interface Person : NSObject

@property (strong) NSString *firstName;
@property (strong) NSString *lastName;
@property (assign) BOOL enjoysTesting;
@property (strong) NSDate *birthdate;
@property (strong) DateProvider *dateProvider;
@property (readonly) NSInteger yearsOld;

@end
