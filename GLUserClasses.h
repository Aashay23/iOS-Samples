//
//  GLUserClasses.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@class GLProfile;
@class GLEditMyProfile;
@class GLQuestionnaireAnswers;
@class GLCompatibilityCriteria;
@class GLManageMyPhotos;

@interface GLUserClasses : NSObject

@property (nonatomic, assign) NSInteger ageMin;
@property (nonatomic, assign) NSInteger ageMax;
@property (nonatomic, assign) NSInteger maxDistance;
@property (nonatomic, assign) NSInteger lookingFor;

-(id)initWithAgeMin:(NSInteger)ageMin
             ageMax:(NSInteger)ageMax
        maxDistance:(NSInteger)maxDistance
         lookingFor:(NSInteger)lookingFor;

@end
