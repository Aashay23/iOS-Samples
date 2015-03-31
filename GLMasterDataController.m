//
//  GLMainDataController.m
//  Greenlight
//

#import "GLMasterDataController.h"
#import "GLProfile.h"
#import "GLEditMyProfile.h"
#import "GLQuestionnaireAnswers.h"
#import "GLCompatibilityCriteria.h"

#import "GLBrowse.h"

@implementation GLMasterDataController

NSInteger DATA_LOAD_MODE = 0; // Used to control data flow 0 = hardcoded, 1 = database

NSInteger loadProfileData(NSInteger personID, GLProfile *profile){
        
    // Load data into profile
    
    return 0; // 0 for success, 1 for failure
}

NSInteger loadEditMyProfileData(NSInteger personID, GLEditMyProfile *editMyProfile){
    
    // Load data into editMyProfile
    
    return 0; // 0 for success, 1 for failure
}

NSInteger loadQuestionnaireAnswers(NSInteger personID, GLQuestionnaireAnswers *questionnaireAnswers){
    
    // Load data into questionnaireAnswers
    
    return 0; // 0 for success, 1 for failure
}

NSInteger loadCompatibilityCriteria(NSInteger personID, GLCompatibilityCriteria *compatibilityCriteria){
    
    // Load data into compatibilityCriteria
    
    return 0; // 0 for success, 1 for failure
}

NSInteger storeEditMyProfileData(NSInteger personID, GLEditMyProfile *editMyProfile){
    
    // Store data from editMyProfile into database
    
    return 0; // 0 for success, 1 for failure
}

NSInteger storeCompatibilityCriteriaData(NSInteger personID, GLCompatibilityCriteria *compatibilityCriteria){
    
    // Store data from compatibilityCriteria into database
    
    return 0; // 0 for success, 1 for failure
}

NSInteger updateInterestedIn(NSInteger personID, NSInteger foreignID){
    
    // Update the user's Interested In for the foreign user (make it true)
    
    return 0; // 0 for success, 1 for failure
}

NSInteger updateBlocked(NSInteger personID, NSInteger foreignID){

    // Update the user's Blocked for the foreign user (make it true)
    
    return 0; // 0 for success, 1 for failure
}

NSInteger loadChatData(NSInteger personID, GLChat *chat){
    
    // Update the user's Blocked for the foreign user (make it true)
    
    return 0; // 0 for success, 1 for failure
}

NSInteger storeGreenlightAnswers(NSInteger personID, GLGreenlightAnswers *greenlightAnswers){
    
    // Update the user's Greenlight answers for the foreign user.
    // personID == foreignID
    // greenlight answers == the users greenlights for that person
    
    return 0; // 0 for success, 1 for failure
}

NSInteger loadGreenlightData(NSInteger personID, GLGreenlights *greenlightData){
    
    // Load the user's Greenlight answers for the foreign user.
    // personID == foreignID
    // greenlight answers == the users greenlights for that foreign person
    // the other data that is loaded is LastName, FirstName, their default photo, and phone number, in addition to the user's answers
    
    return 0; // 0 for success, 1 for failure
}

NSInteger storeQuestionnaireData(NSInteger personID, GLQuestionnaireAnswers *questionnaireAnswers){
    
    // Store the user's Questionnaire answers
    // personID == foreignID
    // greenlight answers == the users greenlights for that person
    
    return 0; // 0 for success, 1 for failure
}

NSInteger populateBrowseList(NSMutableArray *listOfProfiles){
    
    // Populate the listOfProfiles with Browse objects
    
    // GLBrowse is the object that holds the data for each person inside Potentials, Greenlit, and Matches
    GLBrowse *browseProfileData;

    // After you populate each GLBrowse object, add it to the array
    [listOfProfiles addObject:browseProfileData];
    
    return 0; // 0 for success, 1 for failure to access database
}




@end

















