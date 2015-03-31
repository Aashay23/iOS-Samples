//
//  GLUserDataController.h
//  Greenlight
//


#import <Foundation/Foundation.h>

#import "GLEditProfileTableViewController.h"
#import "GLQuestionnaireViewController.h"
#import "GLCompatibilityCriteriaViewController.h"
#import "GLProfilePictureViewController.h"

@class GLForeignProfile;

@interface GLUserDataController : NSObject

@property (nonatomic, /*, copy*/) GLForeignProfile *userProfile;
- (void)updateUserData:(GLEditProfileTableViewController *)editProfileView;
- (void)updateQuestionnaire:(GLQuestionnaireViewController *)takeQuestionnaireView;
- (void)updateCompatibilityCriteria:(GLCompatibilityCriteriaViewController *)compatibilityCriteriaView;
- (void)updateProfilePicture:(GLProfilePictureViewController *)profilePictureView;

@end
