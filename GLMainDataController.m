//
//  GLMainDataController.m
//  Greenlight
//


#import "GLMainDataController.h"
#import "GLProfile.h"
#import "GLEditMyProfile.h"
#import "GLQuestionnaireAnswers.h"
#import "GLCompatibilityCriteria.h"

#import "GLBrowse.h"
#import "GLChat.h"
#import "GLGreenlightAnswers.h"
#import "GLGreenlights.h"

@implementation GLMainDataController

// Used to control data flow
// 0 = hardcoded (debug gui mode), 1 = database (normal mode)
NSInteger DATA_LOAD_MODE = 0;

// When they are set to NO, it is in First Time Use mode
// When these flags are all set to YES, it is in normal mode
bool EDIT_PROFILE_COMPLETE = YES;
bool COMPATIBILITY_CRITERIA_COMPLETE = YES;
bool QUESTIONNAIRE_COMPLETE = YES;
bool PROFILE_PICTURE_COMPLETE = YES;//NO;  //  This will be changed back to NO once we have the Manage My Photos figured out



// Load the user's COMPLETE flags from the database
// This is performed whenever the user logs in, before the Home tab is shown
// The flags on the database should all be initialized to NO;
NSInteger loadCompleteFlags(){
    
    // EDIT_PROFILE_COMPLETE =
    // COMPATIBILITY_CRITERIA_COMPLETE =
    // PROFILE_PICTURE_COMPLETE =
    // QUESTIONNAIRE_COMPLETE =
    
    return 0; // return 0 if successful, return 1 if unsuccessful
}

// Load user profile data
// Store everything into the profile object
NSInteger loadProfileData(GLProfile *profile){
    
    // This is actually the same as the loadForeignProfileData, except loadForeignProfileData is passed a foreignID
    // I currently have loadForeignProfileData and loadProfileData as two separate functions,
    // because I wasn't sure how you are managing the User ID.
    // Is it basically treated as a global variable?
    // If so, we can just pass the UserID variable to the loadForeignProfileData function
    // Do this here:
    NSInteger userID = 12345; // Replace 12345 with the real user id
    
    // Pass it into the loadForeignProfileData function
    if (loadForeignProfileData(userID, profile) == 0)
        return 0; // 0 for success, 1 for failure
    else
        return 1;
    
    // If the code above doesn't work with the way we are managing user ids, then we would have to populate the profile as seen below
    // (otherwise, we dont have to do this):
    // profile.firstName =
    // profile.birthdate =
    // profile.aboutMe =
    // profile.quote =
    // profile.defaultPhoto =
    // profile.education =
    // profile.occupation =
    // profile.hometown =
    // profile.race =
    // profile.advancedInfoGreenlightSync =
    // profile.distance =
    // profile.compatibilityPercentage =
    // profile.personID = user id
    
    // This is for getting the photos:
    /*
     NSData *photoData1 = databaseData1;
     NSData *photoData2 = databaseData2;
     
     UIImage *image1 = [UIImage imageWithData:photoData1];
     UIImage *image2 = [UIImage imageWithData:photoData2];
     
     profile.photos = [[NSArray alloc] initWithObjects:image1, image2, nil];
     */
    
}

// Load user Edit My Profile info
// Store everything into the editMyProfile object
NSInteger loadEditMyProfileData(GLEditMyProfile *editMyProfile){
        
    // editMyProfile.firstName =
    // editMyProfile.gender =
    // editMyProfile.birthday =
    // editMyProfile.aboutMe =
    // editMyProfile.quote =
    // editMyProfile.education =
    // editMyProfile.occupation =
    // editMyProfile.hometown =
    // editMyProfile.race =
    // editMyProfile.coordinates =
    // editMyProfile.location =
    // editMyProfile.phoneNumber =
    // editMyProfile.lastName = 
    
    return 0; // 0 for success, 1 for failure
}

// Load user Questionnaire Answers
// Store everything into the questionnaireAnswers object
NSInteger loadQuestionnaireAnswers(GLQuestionnaireAnswers *questionnaireAnswers){
        
    // questionnaireAnswers.s1TypicalFridayNight =
    // questionnaireAnswers.s2PeopleYouDontKnowVeryWell =
    // questionnaireAnswers.s3MoreFun =
    // questionnaireAnswers.s4Sports =
    // questionnaireAnswers.s5LookingFor =
    // questionnaireAnswers.s6NewThings =
    // questionnaireAnswers.s7Age =
    // questionnaireAnswers.s8Style =
    // questionnaireAnswers.s9Race =
    // questionnaireAnswers.s10Rules =
    // questionnaireAnswers.s11CompetativeDiscussions =
    // questionnaireAnswers.pbq1Wednesday =
    // questionnaireAnswers.pbq2MovieGenre =
    // questionnaireAnswers.pbq3Cup =
    // questionnaireAnswers.pbq4First =
    // questionnaireAnswers.pbq5Second =
    // questionnaireAnswers.pbq6FavoriteDrinking =
    
    return 0; // 0 for success, 1 for failure
}

// Load user Compatibility Criteria
// Store everything into the compatibilityCriteria object
NSInteger loadCompatibilityCriteria(GLCompatibilityCriteria *compatibilityCriteria){
    
    // compatibilityCriteria.ageMin =
    // compatibilityCriteria.ageMax =
    // compatibilityCriteria.maxDistance =
    // compatibilityCriteria.lookingFor =
    
    return 0; // 0 for success, 1 for failure
}

// Store user's editMyProfile data into database
NSInteger storeEditMyProfileData(GLEditMyProfile *editMyProfile){
    
    // editMyProfile.firstName
    // editMyProfile.gender
    // editMyProfile.birthday
    // editMyProfile.aboutMe
    // editMyProfile.quote
    // editMyProfile.education
    // editMyProfile.occupation
    // editMyProfile.hometown
    // editMyProfile.race
    // editMyProfile.coordinates
    // editMyProfile.location
    // editMyProfile.phoneNumber
    // editMyProfile.lastName
    
    // Set the user's editProfileComplete flag on the database to TRUE if everything above was written to the database successfully
    // Don't use EDIT_PROFILE_COMPLETE to update the flag on the database
    // (this is because I will set EDIT_PROFILE_COMPLETE = TRUE after the database operation goes through successfully)
    
    return 0; // 0 for success, 1 for failure
}

// Store user's compatibilityCriteria data into database
NSInteger storeCompatibilityCriteriaData(GLCompatibilityCriteria *compatibilityCriteria){
    
    // compatibilityCriteria.ageMin
    // compatibilityCriteria.ageMax
    // compatibilityCriteria.maxDistance
    // compatibilityCriteria.lookingFor
    
    // Set the user's compatibilityCriteriaComplete flag on the database to TRUE if everything above was written to the database successfully
    // Don't use COMPATIBILITY_CRITERIA_COMPLETE to update the flag on the database
    // (this is because I will set COMPATIBILITY_CRITERIA_COMPLETE = TRUE after the database operation goes through successfully)
    
    return 0; // 0 for success, 1 for failure
}

// Update the user's Interested In flag for the foreign user (make it true)
NSInteger updateInterestedIn(NSInteger foreignID){
    
    // In the database, set the User's Interested In flag to true for the foreignID in the Interactions table
    
    return 0; // 0 for success, 1 for failure
}

// Load foreign user's profile data (using the foreignID)
// Store everything into the profile object
NSInteger loadForeignProfileData(NSInteger foreignID, GLProfile *profile){
    
    // profile.firstName =
    // profile.birthdate =
    // profile.aboutMe =
    // profile.quote =
    // profile.defaultPhoto =
    // profile.education =
    // profile.occupation =
    // profile.hometown =
    // profile.race =
    // profile.advancedInfoGreenlightSync =
    // profile.distance =
    // profile.compatibilityPercentage =
    // profile.photos = 
    
    profile.personID = foreignID; // Keep this as it is, it is used for keeping tack of which profile is being viewed, so it knows who's "More Photos" to load
    
    // This is for getting the photos:
    /*
     NSData *photoData1 = databaseData1;
     NSData *photoData2 = databaseData2;
     
     UIImage *image1 = [UIImage imageWithData:photoData1];
     UIImage *image2 = [UIImage imageWithData:photoData2];
     
     profile.photos = [[NSArray alloc] initWithObjects:image1, image2, nil];
     */
    
    return 0; // 0 for success, 1 for failure
}

// Update the user's Blocked flag for the foreign user (make it true)
NSInteger updateBlocked(NSInteger foreignID){

    // In the database, set the User's Blocked flag to true for the foreignID in the Interactions table
    
    return 0; // 0 for success, 1 for failure
}

// Load the chat data between the user and the foreign user (foreignID)
// It's main purpose is to keep track of the foreignID
// We might not need this function to do load anything from the database
// it depends on how the chat feature works
NSInteger loadChatData(NSInteger foreignID, GLChat *chat, NSString *firstName){
    
    // As of right now, nothing else needs done in this function
    
    chat.firstName = firstName; // keep this as it is
    chat.personID = foreignID; // Keep this line as it is, its just to keep track of which foreign user we are interacting with
    
    return 0; // 0 for success, 1 for failure
}

// Store the User's greenlight answers for the foreign user (foreignID)
// Greenlight answers == the users greenlights for the foreign user
NSInteger storeGreenlightAnswers(NSInteger foreignID, GLGreenlightAnswers *greenlightAnswers){
    
    // These are the user's greenlights for the foreign user that are to be stored in the database:
    
    // greenlightAnswers.iLikeTalkingToYou
    // greenlightAnswers.heresMyNumber
    // greenlightAnswers.heresMyLastName
    // greenlightAnswers.checkOutMyFullProfile
    // greenlightAnswers.iWantToHookUp
    // greenlightAnswers.letsGoOnA1On1Date
    // greenlightAnswers.letsHangOutWithFriends
    
    return 0; // 0 for success, 1 for failure
}

/* Load the greenlight data from the database
 This includes:
 - userGreenlights (the users greenlights for the foreign user)
 - foreignSyncGreenlights (the synced greenlights with the foreign user)
 - foreignPhoneNumber
 - foreignLastName
 - foreignFirstName
 - foreignDefaultPhoto */
NSInteger loadGreenlightData(NSInteger foreignID, GLGreenlights *greenlightData){
    
    // User greenlights for foreign user
    // greenlightData.userGreenlights.iLikeTalkingToYou =
    // greenlightData.userGreenlights.heresMyNumber =
    // greenlightData.userGreenlights.heresMyLastName =
    // greenlightData.userGreenlights.checkOutMyFullProfile =
    // greenlightData.userGreenlights.iWantToHookUp =
    // greenlightData.userGreenlights.letsGoOnA1On1Date =
    // greenlightData.userGreenlights.letsHangOutWithFriends =
    
    // Greenlights synced for foreign user
    // greenlightData.foreignSyncGreenlights.iLikeTalkingToYou =
    // greenlightData.foreignSyncGreenlights.heresMyNumber =
    // greenlightData.foreignSyncGreenlights.heresMyLastName =
    // greenlightData.foreignSyncGreenlights.checkOutMyFullProfile =
    // greenlightData.foreignSyncGreenlights.iWantToHookUp =
    // greenlightData.foreignSyncGreenlights.letsGoOnA1On1Date =
    // greenlightData.foreignSyncGreenlights.letsHangOutWithFriends =
    
    // Greenlight revealed info and contact info
    // greenlightData.foreignPhoneNumber =
    // greenlightData.foreignLastName =
    // greenlightData.foreignFirstName =
    // greenlightData.foreignDefaultPhoto =
    
    return 0; // 0 for success, 1 for failure
}

// Store users questionnaire answers to the database
NSInteger storeQuestionnaireData(GLQuestionnaireAnswers *questionnaireAnswers){
    
    // These are the values that will be stored for the user:
    // questionnaireAnswers.s1TypicalFridayNight
    // questionnaireAnswers.s2PeopleYouDontKnowVeryWell
    // questionnaireAnswers.s3MoreFun
    // questionnaireAnswers.s4Sports
    // questionnaireAnswers.s5LookingFor
    // questionnaireAnswers.s6NewThings
    // questionnaireAnswers.s7Age
    // questionnaireAnswers.s8Style
    // questionnaireAnswers.s9Race
    // questionnaireAnswers.s10Rules
    // questionnaireAnswers.s11CompetativeDiscussions
    // questionnaireAnswers.pbq1Wednesday
    // questionnaireAnswers.pbq2MovieGenre
    // questionnaireAnswers.pbq3Cup
    // questionnaireAnswers.pbq4First
    // questionnaireAnswers.pbq5Second
    // questionnaireAnswers.pbq6FavoriteDrinking
    
    // Set the user's questionnaireComplete flag on the database to TRUE if everything above was written to the database successfully
    // Don't use QUESTIONNAIRE_COMPLETE to update the flag on the database
    // (this is because I will set QUESTIONNAIRE_COMPLETE = TRUE after the database operation goes through successfully)
    
    return 0; // 0 for success, 1 for failure
}

// This is the function that populates the list of Potentials
// It will be populated with browsePotentialsData objects
NSInteger populatePotentialsList(NSMutableArray *listOfPotentials){
    
    // browsePotentialsData is the object that holds the data for each person
    GLBrowse *browsePotentialsData = [GLBrowse alloc];
    
    // browsePotentialsData.firstName =
    // browsePotentialsData.birthdate =
    // browsePotentialsData.quote =
    // browsePotentialsData.defaultPhotoThumbnail =
    // browsePotentialsData.distance =
    // browsePotentialsData.compatibilityPercentage =
    // browsePotentialsData.personID =

    //[NSThread sleepForTimeInterval:5.0f];
    
    // After you populate each browsePotentialsData object, add it to the array
   /* browsePotentialsData.firstName = @"Greg";
    browsePotentialsData.defaultPhotoThumbnail = [UIImage imageNamed:@"man1thumb80.jpg"];
    [listOfPotentials addObject:browsePotentialsData];
    
    browsePotentialsData = [GLBrowse alloc];
    browsePotentialsData.firstName = @"Cindy";
    browsePotentialsData.defaultPhotoThumbnail = [UIImage imageNamed:@"woman1thumb80.jpg"];
    */
    [listOfPotentials addObject:browsePotentialsData];
    
    // Do this several times to fill list of potentials with browsePotentialsData objects
    // We'll have to work on making it load only a certain number of objects initially, and then loading more upon request (similar to how twitter loads a certain number of tweets at a time). Or we could have some other similar approach for handling this potentially large number of people that could be shown.
    
    return 0; // 0 for success, 1 for failure to access database
}

// This is the function that populates the list of Greenlit users
// It will be populated with browseGreenlitData objects
NSInteger populateGreenlitList(NSMutableArray *listOfGreenlit){
    
    // browseGreenlitData is the object that holds the data for each person
    GLBrowse *browseGreenlitData;
    
    // browseGreenlitData.firstName =
    // browseGreenlitData.birthdate =
    // browseGreenlitData.quote =
    // browseGreenlitData.defaultPhotoThumbnail =
    // browseGreenlitData.distance =
    // browseGreenlitData.compatibilityPercentage =
    // browseGreenlitData.personID =
    
    // After you populate each browseGreenlitData object, add it to the array
    [listOfGreenlit addObject:browseGreenlitData];
    
    // Fill the list of greenlit users with browseGreenlitData objects
    // We'll have to work on making it load only a certain number of objects initially, and then loading more upon request (similar to how twitter loads a certain number of tweets at a time). Or we could have some other similar approach for handling this potentially large number of people that could be shown.
    
    return 0; // 0 for success, 1 for failure to access database
}

// This is the function that populates the list of Matches
// It will be populated with browseMatchesData objects
NSInteger populateMatchesList(NSMutableArray *listOfMatches){

    // browseMatchesData is the object that holds the data for each person
    GLBrowse *browseMatchesData = [GLBrowse alloc];
    // browseMatchesData.firstName =
    // browseMatchesData.birthdate =
    // browseMatchesData.quote =
    // browseMatchesData.defaultPhotoThumbnail =
    // browseMatchesData.distance =
    // browseMatchesData.compatibilityPercentage =
    // browseMatchesData.personID =
    
    // After you populate each browseMatchesData object, add it to the array
    [listOfMatches addObject:browseMatchesData];
    
    // Fill the list of matches with browseMatchesData objects
    // We'll have to work on making it load only a certain number of objects initially, and then loading more upon request (similar to how twitter loads a certain number of tweets at a time). Or we could have some other similar approach for handling this potentially large number of people that could be shown.
    
    return 0; // 0 for success, 1 for failure to access database
}

// This stores the user's Profile Picture and Profile Picture Thumbnail into the database
NSInteger storeProfilePicture(UIImage *profilePictureFull, UIImage *profilePictureThumbnail){
    
    // profilePictureFull
    // profilePitctureThumbnail
    
    // Set the user's profilePictureComplete flag on the database to TRUE if everything above was written to the database successfully
    // Don't use PROFILE_PICTURE_COMPLETE to update the flag on the database
    // (this is because I will set PROFILE_PICTURE_COMPLETE = TRUE after the database operation goes through successfully)
    
    return 0; // 0 for success, 1 for failure to access database
}


@end

















