//
//  GLManageMyPhotos.m
//  Greenlight
//


#import "GLManageMyPhotos.h"

@implementation GLManageMyPhotos

-(id)initWithDefaultPhotoThumbnail:(UIImage *)defaultPhotoThumbnail
                      defaultPhoto:(UIImage *)defaultPhoto
                       otherPhotos:(NSMutableArray *)otherPhotos
{
    self = [super init];
    if (self) {
        _defaultPhotoThumbnail = defaultPhotoThumbnail;
        _defaultPhoto = defaultPhoto;
        _otherPhotos = otherPhotos;
        return self;
    }
    return nil;
}

@end
