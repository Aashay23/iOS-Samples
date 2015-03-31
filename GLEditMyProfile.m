//
//  GLEditMyProfile.m
//  Greenlight
//


#import "GLEditMyProfile.h"

@implementation GLEditMyProfile


-(id)initWithFirstName:(NSString *)firstName
                gender:(NSInteger)gender
              birthday:(NSDate *)birthday
               aboutMe:(NSString *)aboutMe
                 quote:(NSString *)quote
             education:(NSString *)education
            occupation:(NSString *)occupation
              hometown:(NSString *)hometown
                  race:(NSString *)race
           coordinates:(CLLocation *)coordinates
              location:(NSString *)location
           phoneNumber:(NSString *)phoneNumber
              lastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _gender = gender;
        _birthday = birthday;
        _aboutMe = aboutMe;
        _quote = quote;
        _education = education;
        _occupation = occupation;
        _hometown = hometown;
        _race = race;
        _coordinates = coordinates;
        _location = location;
        _phoneNumber = phoneNumber;
        _lastName = lastName;
        return self;
    }
    return nil;
}


@end
