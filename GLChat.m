//
//  GLChat.m
//  Greenlight
//


#import "GLChat.h"

@implementation GLChat


-(id)initWithFirstName:(NSString *)firstName
              personID:(NSInteger)personID
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _personID = personID;
        return self;
    }
    return nil;
}


@end
