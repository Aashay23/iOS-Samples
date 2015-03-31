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

@interface GLMasterDataController : NSObject

extern NSInteger DATA_LOAD_MODE;

// Loading in Home tab segues
NSInteger loadProfileData(NSInteger personID, GLProfile *profile);
NSInteger loadEditMyProfileData(NSInteger personID, GLEditMyProfile *editMyProfile);
NSInteger loadQuestionnaireAnswers(NSInteger personID, GLQuestionnaireAnswers *questionnaireAnswers);
NSInteger loadCompatibilityCriteria(NSInteger personID, GLCompatibilityCriteria *compatibilityCriteria);

// Storing Edit My Profile data to database
NSInteger storeEditMyProfileData(NSInteger personID, GLEditMyProfile *editMyProfile);

// Storing Compatibility Criteria data to database
NSInteger storeCompatibilityCriteriaData(NSInteger personID, GLCompatibilityCriteria *compatibilityCriteria);

NSInteger updateInterestedIn(NSInteger personID, NSInteger foreignID);

NSInteger updateBlocked(NSInteger personID, NSInteger foreignID);

NSInteger loadChatData(NSInteger personID, GLChat *chat);

NSInteger storeGreenlightAnswers(NSInteger personID, GLGreenlightAnswers *greenlightAnswers);

NSInteger loadGreenlightData(NSInteger personID, GLGreenlights *greenlightData);

NSInteger storeQuestionnaireData(NSInteger personID, GLQuestionnaireAnswers *questionnaireAnswers);

NSInteger populateBrowseList(NSMutableArray *listOfProfiles);

@end
