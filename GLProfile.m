//
//  GLProfile.m
//  Greenlight
//


#import "GLProfile.h"

@implementation GLProfile

-(id)initWithFirstName:(NSString *)firstName
             birthdate:(NSDate *)birthdate
               aboutMe:(NSString *)aboutMe
                 quote:(NSString *)quote
          defaultPhoto:(UIImage *)defaultPhoto
             education:(NSString *)education
            occupation:(NSString *)occupation
              hometown:(NSString *)hometown
                  race:(NSString *)race
advancedInfoGreenlightSync:(BOOL)advancedInfoGreenlightSync
              distance:(NSInteger)distance
compatibilityPercentage:(NSInteger)compatibilityPercentage
              personID:(NSInteger)personID
                photos:(NSArray *)photos

{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _birthdate = birthdate;
        _aboutMe = aboutMe;
        _quote = quote;
        _defaultPhoto = defaultPhoto;
        _education = education;
        _occupation = occupation;
        _hometown = hometown;
        _race = race;
        _advancedInfoGreenlightSync = advancedInfoGreenlightSync;
        _distance = distance;
        _compatibilityPercentage = compatibilityPercentage;
        _personID = personID;
        _photos = photos;
        return self;
    }
    return nil;
}
@end
