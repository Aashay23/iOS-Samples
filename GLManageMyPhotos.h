//
//  GLManageMyPhotos.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLManageMyPhotos : NSObject

@property (nonatomic, copy) UIImage *defaultPhotoThumbnail;
@property (nonatomic, copy) UIImage *defaultPhoto;
@property (nonatomic, copy) NSMutableArray *otherPhotos;

-(id)initWithDefaultPhotoThumbnail:(UIImage *)defaultPhotoThumbnail
                      defaultPhoto:(UIImage *)defaultPhoto
                       otherPhotos:(NSMutableArray *)otherPhotos;

@end
