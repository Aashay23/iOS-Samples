//
//  GLBrowse.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLBrowse : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSDate *birthdate;
@property (nonatomic, copy) NSString *quote;
@property (nonatomic, copy) UIImage *defaultPhotoThumbnail;
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, assign) NSInteger compatibilityPercentage;
@property (nonatomic, assign) NSInteger personID;

-(id)initWithFirstName:(NSString *)firstName
             birthdate:(NSDate *)birthdate
                 quote:(NSString *)quote
 defaultPhotoThumbnail:(UIImage *)defaultPhotoThumbnail
              distance:(NSInteger)distance
compatibilityPercentage:(NSInteger)compatibilityPercentage
              personID:(NSInteger)personID;

@end
