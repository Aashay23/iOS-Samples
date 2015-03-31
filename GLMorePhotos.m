//
//  GLMorePhotos.m
//  Greenlight


#import "GLMorePhotos.h"

@implementation GLMorePhotos

-(id)initWithPhotos:(NSMutableArray *)photos
{
    self = [super init];
    if (self) {
        _photos = photos;
        return self;
    }
    return nil;
}

@end
