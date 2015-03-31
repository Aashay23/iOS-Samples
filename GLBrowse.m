//
//  GLBrowse.m
//  Greenlight
//


#import "GLBrowse.h"

@implementation GLBrowse

-(id)initWithFirstName:(NSString *)firstName
             birthdate:(NSDate *)birthdate
                 quote:(NSString *)quote
 defaultPhotoThumbnail:(UIImage *)defaultPhotoThumbnail
              distance:(NSInteger)distance
compatibilityPercentage:(NSInteger)compatibilityPercentage
              personID:(NSInteger)personID
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _birthdate = birthdate;
        _quote = quote;
        _defaultPhotoThumbnail = defaultPhotoThumbnail;
        _distance = distance;
        _compatibilityPercentage = compatibilityPercentage;
        _personID = personID;
        return self;
    }
    return nil;
}

@end
