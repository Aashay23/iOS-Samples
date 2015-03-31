//
//  GLMorePhotos.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLMorePhotos : NSObject

@property (nonatomic, copy) NSMutableArray *photos;

-(id)initWithPhotos:(NSMutableArray *)photos;

@end
