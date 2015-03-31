//
//  GLGreenlights.h
//  Greenlight
//


#import <Foundation/Foundation.h>
#import "GLGreenlightAnswers.h"

@interface GLGreenlights : NSObject

@property (nonatomic, copy) GLGreenlightAnswers *userGreenlights;
@property (nonatomic, copy) GLGreenlightAnswers *foreignSyncGreenlights;
@property (nonatomic, copy) NSString *foreignPhoneNumber;
@property (nonatomic, copy) NSString *foreignLastName;
@property (nonatomic, copy) NSString *foreignFirstName;
@property (nonatomic, copy) UIImage *foreignDefaultPhoto;


-(id)initWithUserGreenlights:(GLGreenlightAnswers *)userGreenlights
      foreignSyncGreenlights:(GLGreenlightAnswers *)foreignSyncGreenlights
          foreignPhoneNumber:(NSString *)foreignPhoneNumber
             foreignLastName:(NSString *)foreignLastName
            foreignFirstName:(NSString *)foreignFirstName
         foreignDefaultPhoto:(UIImage *)foreignDefaultPhoto;

@end
