//
//  GLEditMyProfile.h
//  Greenlight
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GLEditMyProfile : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, assign) NSInteger gender; // 0 = male, 1 = female
@property (nonatomic, copy) NSDate *birthday;
@property (nonatomic, copy) NSString *aboutMe;
@property (nonatomic, copy) NSString *quote;
@property (nonatomic, copy) NSString *education;
@property (nonatomic, copy) NSString *occupation;
@property (nonatomic, copy) NSString *hometown;
@property (nonatomic, copy) NSString *race;
@property (nonatomic, copy) CLLocation *coordinates;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *lastName;

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
              lastName:(NSString *)lastName;

@end
