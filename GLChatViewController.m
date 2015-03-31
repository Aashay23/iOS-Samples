//
//  GLChatViewController.m
//  Greenlight


#import "GLChatViewController.h"
#import "GLGreenlightViewController.h"

#import "GLMainDataController.h"
#import "GLChat.h"
#import "GLGreenlights.h"

@interface GLChatViewController ()
@end

@implementation GLChatViewController

- (void)setForeignProfile:(GLForeignProfile *) newForeignProfile
{
    if (_foreignProfile != newForeignProfile) {
        _foreignProfile = newForeignProfile;
        
        // Update the view.
        [self configureView];
    }
}
- (void)setChat:(GLChat *) newChat
{
    if (_chat != newChat) {
        _chat = newChat;
        
        // Update the view.
        [self configureView];
    }
}

/*
- (void)setUserProfile:(GLForeignProfile *) newUserProfile
{
    if (_userProfile != newUserProfile) {
        _userProfile = newUserProfile;
        
        // Update the view.
        [self configureView];
    }
}
 */

- (void)configureView
{
    // Update the user interface for the detail item.
    GLForeignProfile *theForeignProfile = self.foreignProfile;
  //  GLForeignProfile *theUserProfile = self.userProfile;
    GLChat *theChat = self.chat;
    
    NSString *firstName;
    
    switch (DATA_LOAD_MODE) {
        case 0:
            if (theForeignProfile) {
                firstName = theForeignProfile.name;
            }
            break;
        case 1:
            if (theChat) {
                firstName = theChat.firstName;
            }
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
    /*
     if (theForeignProfile ) { // && theUserProfile
         self.foreignNameLabel.text = [NSString stringWithFormat:@"Conversation with %@",theForeignProfile.name];
         //  self.userNameLabel.text = theUserProfile.name;
     }
    */
    
    self.foreignNameLabel.text = [NSString stringWithFormat:@"Conversation with %@",firstName];


}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.greenlightsSubview.hidden = YES;
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Show Greenlights view

// Shows the Greenlights view
// Note: The Greenlights view is a subview (a container view to be exact) that appears as if it is a new view controller appearing modally
// The reason behind this is because it needs to have a transparent backgroud, so it needed to be added as a subview to the Chat View
- (IBAction)greenlightsButton:(id)sender {
    
    // Get a pointer to the GreenlightView
    GLGreenlightViewController *greenlightView = (GLGreenlightViewController *)self.childViewControllers[0];
    //[greenlightView viewDidLoad];
    [greenlightView configureView];
    
    // Set the Greenlights nav bar buttons
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveGreenlightsView:)];
    
    // Set Save button's color (it wouldn't set to its normal color inside storyboard view, so it had to be done programmatically)
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.0f/255.0f green:153.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0 green:153 blue:255 alpha:0];//[UIColor colorWithRed:0 green:153 blue:255 alpha:0.4];
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:0.1 green:0.5 blue:0.7 alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelGreenlightsView:)];
    
    // Hide the back button
    [self.navigationItem setHidesBackButton:YES];
    
    // Set the title and the frame
    self.title = @"Greenlights";
    CGRect originalContainterViewFrame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    
    // Set where it will hide off screen
    self.greenlightsSubview.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    // Dont hide it, since it will just slide in and out of view
    self.greenlightsSubview.hidden = NO;
    
    // Animate in
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.greenlightsSubview.frame = originalContainterViewFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    // Hide the tab bar
    self.tabBarController.tabBar.hidden = YES;     
}

#pragma mark - Save greenlights changes

- (IBAction)saveGreenlightsView:(id)sender {
    
    // Get a pointer to the greenlightView
    GLGreenlightViewController *greenlightView = (GLGreenlightViewController *)self.childViewControllers[0];
    
#pragma mark - UPDATE DATABASE with greenlights here
    // UPDATE DATABASE HERE
    
    NSInteger successFailFlag = -1;
    
    switch (DATA_LOAD_MODE) {
        case 0:
            successFailFlag = 0;
            break;
        case 1:
            
            #pragma mark - STORE TO DATABASE HERE
            successFailFlag = storeGreenlightAnswers(self.chat.personID, self.greenlightData.userGreenlights);
            
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
    
    if(successFailFlag == 0){ // database update successful
        NSLog(@"Database updated data successfully");
        
        switch (DATA_LOAD_MODE) {
            case 0:
                self.foreignProfile.userGreenlightAnswers.iLikeTalkingToYou = greenlightView.buttonILikeTalkingToYou.choice;
                self.foreignProfile.userGreenlightAnswers.heresMyNumber = greenlightView.buttonHeresMyNumber.choice;
                self.foreignProfile.userGreenlightAnswers.heresMyLastName = greenlightView.buttonHeresMyLastName.choice;
                self.foreignProfile.userGreenlightAnswers.checkOutMyFullProfile = greenlightView.buttonCheckOutMyFullProfile.choice;
                self.foreignProfile.userGreenlightAnswers.iWantToHookUp = greenlightView.buttonIWantToHookUp.choice;
                self.foreignProfile.userGreenlightAnswers.letsGoOnA1On1Date = greenlightView.buttonLetsGoOnA1On1Date.choice;
                self.foreignProfile.userGreenlightAnswers.letsHangOutWithFriends = greenlightView.buttonLetsHangOutWithFriends.choice;
                break;
            case 1:
                self.greenlightData.userGreenlights.iLikeTalkingToYou = greenlightView.buttonILikeTalkingToYou.choice;
                self.greenlightData.userGreenlights.heresMyNumber = greenlightView.buttonHeresMyNumber.choice;
                self.greenlightData.userGreenlights.heresMyLastName = greenlightView.buttonHeresMyLastName.choice;
                self.greenlightData.userGreenlights.checkOutMyFullProfile = greenlightView.buttonCheckOutMyFullProfile.choice;
                self.greenlightData.userGreenlights.iWantToHookUp = greenlightView.buttonIWantToHookUp.choice;
                self.greenlightData.userGreenlights.letsGoOnA1On1Date = greenlightView.buttonLetsGoOnA1On1Date.choice;
                self.greenlightData.userGreenlights.letsHangOutWithFriends = greenlightView.buttonLetsHangOutWithFriends.choice;
                break;
            default:
                break;
        }
     
        [self hideGreenlightsView];
    }
    else if (successFailFlag == 1){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not contact the server"
                                                        message:@"Could not update the greenlights"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        NSLog(@"Error: Invalid successFailFlag value %d",successFailFlag);
    }
}

#pragma mark - Cancel greenlights changes

- (IBAction)cancelGreenlightsView:(id)sender {
    [self hideGreenlightsView];
}

#pragma mark - Hide Greenlights view

// Hides the greenlights view by sliding it
- (void) hideGreenlightsView{
    
    // Get rid of the nav bar buttons, show the back button, and rename the title
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    [self.navigationItem setHidesBackButton:NO];
    self.title = @"Chat";
    
    // Set the off screen frame
    CGRect newContainterViewFrame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    // Set the on screen frame
    self.greenlightsSubview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    // Slide Greenlights view off screen
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.greenlightsSubview.frame = newContainterViewFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    // Show right bar button item that takes you to the Greenlights view again
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"Greenlights"
                                              style:UIBarButtonItemStyleBordered
                                              target:self
                                              action:@selector(greenlightsButton:)];
    
    // Unhide the tab bar
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - Load greenlight data
// this is where the database is updated and verified
// this also has the potential to stop the segue from occuring between Edit My Profile (save) and Home
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
 
    switch (DATA_LOAD_MODE) {
        case 0:
            return YES;
            break;
        case 1:
            
            if ([identifier isEqualToString: @"ChatToGreenlights"]){
                NSInteger successFailFlag = -1;
                
                self.greenlightData = [GLGreenlights alloc];
                
                #pragma mark - LOAD FROM DATABASE HERE
                successFailFlag = loadGreenlightData(self.chat.personID, self.greenlightData); // self.chat.personID == foreignID
                
                if (successFailFlag == 1){ // database update fails
                    UIAlertView *errorAlert = [[UIAlertView alloc]
                                               initWithTitle:@"Error" message:@"Failed to Connect to Database" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [errorAlert show];
                    
                    // Manually deselect the highlighted row
                    return NO;
                }
                else if (successFailFlag == 0){
                    NSLog(@"Database loaded data successfully");
                    return YES;
                }
                else{ //
                    NSLog(@"Error: Invalid successFailFlag value %d",successFailFlag);
                    return NO;
                }
            }
            
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    return YES;
}


#pragma mark - Prepare for Segue

// Prepare to send data to Greenlights view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ChatToGreenlights"]) {
        /*
        GLGreenlightViewController *detailViewController = [segue destinationViewController];
        detailViewController.foreignProfile = self.foreignProfile;
         */
        
        GLGreenlightViewController *detailViewController = [segue destinationViewController];

        
        switch (DATA_LOAD_MODE) {
            case 0:
                detailViewController.foreignProfile = self.foreignProfile;
                break;
            case 1:
                detailViewController.greenlightData = self.greenlightData;
                break;
            default:
                NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
                break;
        }
        
        
        
    }
}

@end





















