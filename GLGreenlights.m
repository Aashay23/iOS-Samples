//
//  GLGreenlights.m
//  Greenlight
//

#import "GLGreenlights.h"

@implementation GLGreenlights

-(id)initWithUserGreenlights:(GLGreenlightAnswers *)userGreenlights
      foreignSyncGreenlights:(GLGreenlightAnswers *)foreignSyncGreenlights
          foreignPhoneNumber:(NSString *)foreignPhoneNumber
             foreignLastName:(NSString *)foreignLastName
            foreignFirstName:(NSString *)foreignFirstName
         foreignDefaultPhoto:(UIImage *)foreignDefaultPhoto
{
    self = [super init];
    if (self) {
        _userGreenlights = userGreenlights;
        _foreignSyncGreenlights = foreignSyncGreenlights;
        _foreignPhoneNumber = foreignPhoneNumber;
        _foreignLastName = foreignLastName;
        _foreignFirstName = foreignFirstName;
        _foreignDefaultPhoto = foreignDefaultPhoto;
        return self;
    }
    return nil;
}

@end
