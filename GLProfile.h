//
//  GLProfile.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLProfile : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSDate *birthdate;
@property (nonatomic, copy) NSString *aboutMe;
@property (nonatomic, copy) NSString *quote;
@property (nonatomic, copy) UIImage *defaultPhoto;
@property (nonatomic, copy) NSString *education;
@property (nonatomic, copy) NSString *occupation;
@property (nonatomic, copy) NSString *hometown;
@property (nonatomic, copy) NSString *race;
@property (nonatomic, assign) BOOL advancedInfoGreenlightSync;
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, assign) NSInteger compatibilityPercentage;
@property (nonatomic, assign) NSInteger personID;
@property (nonatomic, copy) NSArray *photos;


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
                photos:(NSArray *)photos;

@end
