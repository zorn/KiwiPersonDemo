// PersonSpec.m
#import "Kiwi.h"
#import "Person.h"
#import "DateProvider.h"

// https://github.com/allending/Kiwi/wiki/Expectations

SPEC_BEGIN(PersonSpec)

describe(@"The Person class", ^{
    
    __block Person *person = nil;
    
    beforeAll(^{ // Occurs once
    });
    
    afterAll(^{ // Occurs once
    });
    
    beforeEach(^{ // Occurs before each enclosed "it"
        person = [[Person alloc] init];
    });
    
    afterEach(^{ // Occurs after each enclosed "it"
        person = nil;
    });
    
    context(@"when first created", ^{
        
        it(@"it exsists and is of Person class", ^{
            [person shouldNotBeNil];
            [[person should] beKindOfClass:[Person class]];
        });
        
        it(@"has an readwrite NSString attribute called firstName", ^{
            NSString *newStringValue = @"Some cool string.";
            person.firstName = newStringValue;
            [ [person.firstName should] equal:newStringValue];
        });
        
        it(@"has an readwrite NSString attribute called lastName", ^{
            NSString *newStringValue = @"Some cool string.";
            person.lastName = newStringValue;
            [ [person.lastName should] equal:newStringValue];
        });
        
        it(@"has an readwrite BOOL attribute called enjoyesTesting which defaults to YES", ^{
            [[theValue(person.enjoysTesting) should] beTrue];
        });
        
        it(@"has an readwrite NSDate attribute called birthdate", ^{
            NSDate *newDateValue = [NSDate date];
            person.birthdate = newDateValue;
            [ [person.birthdate should] equal:newDateValue];
        });
        
        context(@"with a birthdate of nil", ^{
           it(@"returns -1 for yearsOld", ^{
               [person.birthdate shouldBeNil];
               [[theValue(person.yearsOld) should] equal:theValue(-1)];
           });
        });
        
        context(@"having a birthdate of 7/11/1979", ^{
            
            __block NSDateFormatter *dateFormatter = nil;
            
            beforeEach(^{ // Occurs before each enclosed "it"
                dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                person.birthdate = [dateFormatter dateFromString:@"1979-07-11"];
            });
            
            afterEach(^{ // Occurs after each enclosed "it"
                dateFormatter = nil;
                person.birthdate = nil;
            });
            
            it(@"is 36 years old on 7/12/2012 with a birthdate of 7/11/2012", ^{
                NSDate *julyTwelfthTwoThousandTwo = [dateFormatter dateFromString:@"2012-07-12"];
                DateProvider *dateProvider = [[DateProvider alloc] init];
                dateProvider.staticNowDate = julyTwelfthTwoThousandTwo;
                person.dateProvider = dateProvider;
                                
                [[theValue(person.yearsOld) should] equal:theValue(33)];
            });
        });
        
        // Homework
        pending(@"has a setName method which auto splits into firstName and lastName", ^{
//            Mike Zornek -> f:Mike l:Zornek
//            Zornek, Mike -> f: Mike l:Zornek
//            Mike Zornek, PhD -> f:Mike l:Zornek, PhD
//            Mr. Michael Zornek -> f:Mike l:Zornek, Mr.
//            Michael Donald George Zornek -> f:Michael Donald George l:Zornek
//            Mike Zornek, Jr. -> f:Mike l:Zornek, Jr.
        });
        
    });
    
    context(@"with a firstName and lastName assigned", ^{
        
        beforeEach(^{ // Occurs before each enclosed "it"
            person.firstName = @"Mike";
            person.lastName = @"Zornek";
        });
        
        afterEach(^{ // Occurs after each enclosed "it"
            person.firstName = nil;
            person.lastName = nil;
        });
        
        it(@"has a displayName method that returns 'FirstName LastName'", ^{
            [[person.displayName should] equal:@"Mike Zornek"];
        });
        
        it(@"has a displayNameWithLastNameFirst:YES method that returns 'LastName, FirstName'", ^{
            [[[person displayNameWithLastNameFirst:YES] should] equal:@"Zornek, Mike"];
        });
        
    });
    
    
});

SPEC_END