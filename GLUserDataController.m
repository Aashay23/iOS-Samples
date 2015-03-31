//
//  GLUserDataController.m
//  Greenlight
//


#import "GLUserDataController.h"
#import "GLForeignProfile.h"
#import "GLEditProfileTableViewController.h"

#import "GLMainDataController.h"

#import "GLProfilePictureViewController.h"

@interface GLUserDataController()
-(void)initializeUserData;
@end

@implementation GLUserDataController

#pragma mark - Populate userProfile object

#pragma mark - THIS IS WHERE I HARD CODED THE USER PROFILE DATA IN

// Populate userProfile object
- (void)initializeUserData {

    // Set up date formatter
    NSDateFormatter* myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"MM/dd/yyyy"];
    
    // Setting the maximum date selectable = 18
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:-21];
    NSDate *eighteenYearsAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
    
    CLLocation *coordinatesActual = [[CLLocation alloc] initWithLatitude:40.000 longitude:-78.000];
    NSDate* birtdayDate = eighteenYearsAgo;//[myFormatter dateFromString:@"1/1/1990"];
    GLQuestionnaireAnswers* answers = [[GLQuestionnaireAnswers alloc] initWithS1TypicalFridayNight:2
                                                          s2PeopleYouDontKnowVeryWell:1
                                                                            s3MoreFun:2
                                                                             s4Sports:0
                                                                         s5LookingFor:1
                                                                          s6NewThings:0
                                                                                s7Age:2
                                                                              s8Style:0
                                                                               s9Race:0
                                                                             s10Rules:1
                                                            s11CompetativeDiscussions:0
                                                                        pbq1Wednesday:0
                                                                       pbq2MovieGenre:1
                                                                              pbq3Cup:2
                                                                            pbq4First:2
                                                                           pbq5Second:1
                                                                 pbq6FavoriteDrinking:1];
    GLGreenlightAnswers* foreignGreenlightAnswers = [[GLGreenlightAnswers alloc] initWithInterestedIn:FALSE
                                                                                    iLikeTalkingToYou:FALSE
                                                                                        heresMyNumber:FALSE
                                                                                      heresMyLastName:FALSE
                                                                                checkOutMyFullProfile:TRUE                                                                                                          iWantToHookUp:FALSE
                                                                                    letsGoOnA1On1Date:FALSE
                                                                               letsHangOutWithFriends:FALSE];// not used by user
    GLGreenlightAnswers* userGreenlightAnswers = [[GLGreenlightAnswers alloc] initWithInterestedIn:FALSE
                                                                                 iLikeTalkingToYou:FALSE
                                                                                     heresMyNumber:FALSE
                                                                                   heresMyLastName:FALSE
                                                                             checkOutMyFullProfile:TRUE                                                                                                     iWantToHookUp:FALSE
                                                                                 letsGoOnA1On1Date:FALSE
                                                                            letsHangOutWithFriends:FALSE];// not used by user
    GLCompatibilityCriteria* compatibilityCriteria = [[GLCompatibilityCriteria alloc] initWithAgeMin:18
                                                                                              ageMax:28
                                                                                         maxDistance:30
                                                                                          lookingFor:1];
    self.userProfile = [[GLForeignProfile alloc]
                        initWithName:@"Michael"
                        lastName:@"Johnson"
                        phoneNumber:@"4125551212"
                        coordinates:coordinatesActual
                        location:@"Pittsburgh, Pennsylvania US"
                        distance:@"0"
                        birthday:birtdayDate
                        profilePicture:[UIImage imageNamed:@"man1.jpg"]
                        profilePictureThumb:[UIImage imageNamed:@"man1thumb80.jpg"]
                        aboutMe:@"This is my about me section. filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler filler"
                        quote:@"Looking for an awesome girl"
                        questionnaireAnswers:answers
                        foreignGreenlightAnswers:foreignGreenlightAnswers
                        userGreenlightAnswers:userGreenlightAnswers
                        compatibilityCriteria:compatibilityCriteria
                        education:@"BS in Business Penn State"
                        occupation:@"CEO Company A"
                        hometown:@"Ausin, TX"
                        race:@"Caucasian"
                        compatibilityPercentage:100
                        gender:0
                        photos:[[NSArray alloc] initWithObjects:[UIImage imageNamed:@"lava.jpeg"],
                                                                [UIImage imageNamed:@"audi.jpg"],
                                                                nil]];
}

// Do we need a setter method?


// initialize the data controller object (a new instance of itself)
- (id)init {
    if (self = [super init]) {
        [self initializeUserData];
        return self;
    }
    return nil;
}


#pragma mark - Edit Profile Updater

// EDIT PROFILE UPDATER
// this function does not execute if the - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender function inside of GLEditProfileTableViewController returns NO. THAT function is where the database should update (so that it can verify before segueing back)
- (void)updateUserData:(GLEditProfileTableViewController *)editProfileView {
   
    // convert date string to a date
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterMediumStyle];
    NSDate *birthdayDate = [dateFormat dateFromString:editProfileView.birthdayTextField.text];
    
    switch (DATA_LOAD_MODE) {
        case 0:

            // copy user entries to userProfile object
            self.userProfile.birthday = birthdayDate;//[editProfileView.birthdayTextField.text copy];
            self.userProfile.quote = [editProfileView.quoteTextField.text copy];
            self.userProfile.aboutMe = [editProfileView.aboutMeTextView.text copy];
            
            self.userProfile.coordinates = [editProfileView.coordinates copy];      // this is the coordinates that are hidden, and stored to find distances
            self.userProfile.location = [editProfileView.locationLabel.text copy];  // this is the location name, ie city, state
            
            self.userProfile.name = [editProfileView.firstNameTextField.text copy];
            self.userProfile.gender = editProfileView.genderTextField.index;
            self.userProfile.education = [editProfileView.educationTextField.text copy];
            self.userProfile.occupation = [editProfileView.occupationTextField.text copy];
            self.userProfile.hometown = [editProfileView.hometownTextField.text copy];
            self.userProfile.race = [editProfileView.raceTextField.text copy];
            self.userProfile.phoneNumber = [editProfileView.phoneNumberTextField.text copy];
            self.userProfile.lastName = [editProfileView.lastNameTextField.text copy];
            
            NSLog(@"Edit My Profile updated successfully! (in RAM)");
            
            break;
        case 1:
            // Do nothing because it reloads the data every time anyway
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    

}

#pragma mark - Questionnaire Updater

// QUESTIONNAIRE UPDATER
// this function does not execute if the - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender function inside of GLQuestionnaireTableViewController returns NO. THAT function is where the database should update (so that it can verify before segueing back)
- (void)updateQuestionnaire:(GLQuestionnaireViewController *)takeQuestionnaireView {
    

    
    
    switch (DATA_LOAD_MODE) {
        case 0:
            self.userProfile.questionnaireAnswers.s1TypicalFridayNight = takeQuestionnaireView.s1slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s2PeopleYouDontKnowVeryWell = takeQuestionnaireView.s2slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s3MoreFun = takeQuestionnaireView.s3slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s4Sports = takeQuestionnaireView.s4slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s5LookingFor = takeQuestionnaireView.s5slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s6NewThings = takeQuestionnaireView.s6slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s7Age = takeQuestionnaireView.s7slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s8Style = takeQuestionnaireView.s8slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s9Race = takeQuestionnaireView.s9slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s10Rules = takeQuestionnaireView.s10slider.SelectedIndex;
            self.userProfile.questionnaireAnswers.s11CompetativeDiscussions = takeQuestionnaireView.s11slider.SelectedIndex;
            
            self.userProfile.questionnaireAnswers.pbq1Wednesday = takeQuestionnaireView.pbq1TextField.index;
            self.userProfile.questionnaireAnswers.pbq2MovieGenre = takeQuestionnaireView.pbq2TextField.index;
            self.userProfile.questionnaireAnswers.pbq3Cup = takeQuestionnaireView.pbq3TextField.index;
            self.userProfile.questionnaireAnswers.pbq4First = takeQuestionnaireView.pbq4TextField.index;
            self.userProfile.questionnaireAnswers.pbq5Second = takeQuestionnaireView.pbq5TextField.index;
            self.userProfile.questionnaireAnswers.pbq6FavoriteDrinking = takeQuestionnaireView.pbq6TextField.index;
            
            NSLog(@"Questionnaire updated successfully! (in RAM)");
            break;
        case 1:
            // Do nothing because it reloads the data every time anyway
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
}

#pragma mark - Compatibility Criteria Updater

// COMPATIBILITY CRITERIA UPDATER
// this function does not execute if the - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender function inside of GLCompatibilityCriteriaViewController returns NO. THAT function is where the database should update (so that it can verify before segueing back)
- (void)updateCompatibilityCriteria:(GLCompatibilityCriteriaViewController *)compatibilityCriteriaView{
    
    switch (DATA_LOAD_MODE) {
        case 0:
            self.userProfile.compatibilityCriteria.ageMin = compatibilityCriteriaView.ageMinSlider.value;
            self.userProfile.compatibilityCriteria.ageMax = compatibilityCriteriaView.ageMaxSlider.value;
            self.userProfile.compatibilityCriteria.maxDistance = compatibilityCriteriaView.maxDistanceSlider.value;
            self.userProfile.compatibilityCriteria.lookingFor = compatibilityCriteriaView.lookingForTextField.index;
            
            NSLog(@"Compatibility Criteria updated successfully! (in RAM)");

            break;
        case 1:
            // Do nothing because it reloads the data every time anyway
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
}


#pragma mark - Profile Picture Updater

// PROFILE PICTURE UPDATER
// this function does not execute if the - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender function inside of GLProfilePictureViewController returns NO. THAT function is where the database should update (so that it can verify before segueing back)
- (void)updateProfilePicture:(GLProfilePictureViewController *)profilePictureView{
    
    switch (DATA_LOAD_MODE) {
        case 0:            
            self.userProfile.profilePicture = profilePictureView.modifiedImage;
            NSLog(@"Profile Picture updated successfully! (in RAM)");
            break;
        case 1:
            // Do nothing because it reloads the data every time anyway
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
}


@end
