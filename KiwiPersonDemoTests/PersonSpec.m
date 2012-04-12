#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

describe(@"The Person class", ^{
    
    context(@"when first created", ^{
        
        pending(@"has an readwrite NSString attribute called firstName", ^{
        });
        
        pending(@"has an readwrite NSString attribute called lastName", ^{
        });
        
        pending(@"has an readwrite BOOL attribute called enjoyesTesting which defaults to YES", ^{
        });
        
        pending(@"has an readwrite NSDate attribute called birthdate", ^{
        });
        
        pending(@"has an read NSUInteger attribute called yearsOld", ^{
        });
        
        pending(@"has a setName method which auto splits into firstName and lastName", ^{
//            Mike Zornek
//            Zornek, Mike
//            Mike Zornek, PhD
//            Mr. Michael Zornek
//            Michael Donald George Zornek
//            Mike Zornek, Jr.
        });
        
    });
    
    context(@"with a firstName and lastName assigned", ^{
        
        pending(@"has a displayName method that returns 'FirstName LastName'", ^{
        });
        
        pending(@"has a displayNameWithLastNameFirst:YES method that returns 'LastName, FirstName'", ^{
        });
        
    });
    
    
});

SPEC_END