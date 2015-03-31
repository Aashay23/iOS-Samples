//
//  GLGreenlightAnswers.m
//  Greenlight
//

#import "GLGreenlightAnswers.h"

@implementation GLGreenlightAnswers

-(id)initWithInterestedIn:(BOOL)interestedIn
        iLikeTalkingToYou:(BOOL)iLikeTalkingToYou
            heresMyNumber:(BOOL)heresMyNumber
          heresMyLastName:(BOOL)heresMyLastName
    checkOutMyFullProfile:(BOOL)checkOutMyFullProfile
            iWantToHookUp:(BOOL)iWantToHookUp
        letsGoOnA1On1Date:(BOOL)letsGoOnA1On1Date
   letsHangOutWithFriends:(BOOL)letsHangOutWithFriends;{
    self = [super init];
    if (self) {
        _interestedIn = interestedIn;
        _iLikeTalkingToYou = iLikeTalkingToYou;
        _heresMyNumber = heresMyNumber;
        _heresMyLastName = heresMyLastName;
        _checkOutMyFullProfile = checkOutMyFullProfile;
        _iWantToHookUp = iWantToHookUp;
        _letsGoOnA1On1Date = letsGoOnA1On1Date;
        _letsHangOutWithFriends = letsHangOutWithFriends;
        return self;
    }
    return nil;
}

@end
