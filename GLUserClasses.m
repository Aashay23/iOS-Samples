//
//  GLUserClasses.m
//  Greenlight
//


#import "GLUserClasses.h"

@implementation GLUserClasses

-(id)initWithAgeMin:(NSInteger)ageMin
             ageMax:(NSInteger)ageMax
        maxDistance:(NSInteger)maxDistance
         lookingFor:(NSInteger)lookingFor
{
    self = [super init];
    if (self) {
        _ageMin = ageMin;
        _ageMax = ageMax;
        _maxDistance = maxDistance;
        _lookingFor = lookingFor;
        return self;
    }
    return nil;
}

@end
