//
//  GLChat.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLChat : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, assign) NSInteger personID;


-(id)initWithFirstName:(NSString *)firstName personID:(NSInteger)personID;

@end
