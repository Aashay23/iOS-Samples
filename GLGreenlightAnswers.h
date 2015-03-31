//
//  GLGreenlightAnswers.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLGreenlightAnswers : NSObject

@property (nonatomic, assign) BOOL interestedIn;
@property (nonatomic, assign) BOOL iLikeTalkingToYou;
@property (nonatomic, assign) BOOL heresMyNumber;
@property (nonatomic, assign) BOOL heresMyLastName;
@property (nonatomic, assign) BOOL checkOutMyFullProfile;
@property (nonatomic, assign) BOOL iWantToHookUp;
@property (nonatomic, assign) BOOL letsGoOnA1On1Date;
@property (nonatomic, assign) BOOL letsHangOutWithFriends;

-(id)initWithInterestedIn:(BOOL)interestedIn
        iLikeTalkingToYou:(BOOL)iLikeTalkingToYou
            heresMyNumber:(BOOL)heresMyNumber
          heresMyLastName:(BOOL)heresMyLastName
    checkOutMyFullProfile:(BOOL)checkOutMyFullProfile
            iWantToHookUp:(BOOL)iWantToHookUp
        letsGoOnA1On1Date:(BOOL)letsGoOnA1On1Date
   letsHangOutWithFriends:(BOOL)letsHangOutWithFriends;

@end
