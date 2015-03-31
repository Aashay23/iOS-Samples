//
//  GLCompatibilityCriteria.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLCompatibilityCriteria : NSObject

@property (nonatomic, assign) NSInteger ageMin;
@property (nonatomic, assign) NSInteger ageMax;
@property (nonatomic, assign) NSInteger maxDistance;
@property (nonatomic, assign) NSInteger lookingFor;

-(id)initWithAgeMin:(NSInteger)ageMin
             ageMax:(NSInteger)ageMax
        maxDistance:(NSInteger)maxDistance
         lookingFor:(NSInteger)lookingFor;

@end
