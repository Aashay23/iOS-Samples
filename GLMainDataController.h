//
//  GLMainDataController.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@class GLProfile;
@class GLEditMyProfile;
@class GLQuestionnaireAnswers;
@class GLCompatibilityCriteria;
@class GLChat;
@class GLGreenlightAnswers;
@class GLGreenlights;
@class GLBrowse;

@interface GLMainDataController : NSObject

extern NSInteger DATA_LOAD_MODE;

extern bool EDIT_PROFILE_COMPLETE;
extern bool COMPATIBILITY_CRITERIA_COMPLETE;
extern bool PROFILE_PICTURE_COMPLETE;
extern bool QUESTIONNAIRE_COMPLETE;

// Load COMPLETE flags
NSInteger loadCompleteFlags();

// Loading in Home tab segues
NSInteger loadProfileData(GLProfile *profile);
NSInteger loadEditMyProfileData(GLEditMyProfile *editMyProfile);
NSInteger loadQuestionnaireAnswers(GLQuestionnaireAnswers *questionnaireAnswers);
NSInteger loadCompatibilityCriteria(GLCompatibilityCriteria *compatibilityCriteria);

// Storing Edit My Profile data to database
NSInteger storeEditMyProfileData(GLEditMyProfile *editMyProfile);

// Storing Compatibility Criteria data to database
NSInteger storeCompatibilityCriteriaData(GLCompatibilityCriteria *compatibilityCriteria);

NSInteger updateInterestedIn(NSInteger foreignID);

NSInteger updateBlocked(NSInteger foreignID);

NSInteger loadChatData(NSInteger foreignID, GLChat *chat, NSString *firstName);

NSInteger storeGreenlightAnswers(NSInteger foreignID, GLGreenlightAnswers *greenlightAnswers);

NSInteger loadGreenlightData(NSInteger foreignID, GLGreenlights *greenlightData);

NSInteger storeQuestionnaireData(GLQuestionnaireAnswers *questionnaireAnswers);

NSInteger loadForeignProfileData(NSInteger foreignID, GLProfile *profile);

NSInteger populatePotentialsList(NSMutableArray *listOfPotentials);
NSInteger populateGreenlitList(NSMutableArray *listOfGreenlit);
NSInteger populateMatchesList(NSMutableArray *listOfMatches);


NSInteger storeProfilePicture(UIImage *profilePictureFull, UIImage *profilePictureThumbnail);



@end
