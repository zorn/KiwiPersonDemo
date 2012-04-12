//
//  DateProvider.h
//  KiwiPersonDemo
//
//  Created by Michael Zornek on 4/12/12.
//  Copyright (c) 2012 Clickable Bliss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateProvider : NSObject

@property (strong) NSDate *staticNowDate;
@property (readonly) NSDate *date;

@end
