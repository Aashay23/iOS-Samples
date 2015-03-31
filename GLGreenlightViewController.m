//
//  GLGreenlightViewController.m
//  Greenlight
//


#import "GLGreenlightViewController.h"
#import "GLForeignProfile.h"

#import "GLMainDataController.h"
#import "GLGreenlights.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <QuartzCore/QuartzCore.h>

@interface GLGreenlightViewController ()
- (void)showData:(NSInteger)tag;
- (void)hideData:(NSInteger)tag;
@end

// Constants
NSString *awaitingGreenlight = @"Awaiting Greenlight";
NSString *greenlightEmpty = @"greenlightEmpty.png";
NSString *greenlightUserClick = @"greenlightUserClick.png";
NSString *greenlightFull = @"greenlightFull.png";
const NSInteger numberButtonTag = 1;
const NSInteger lastNameButtonTag = 2;

@implementation GLGreenlightViewController

- (void)setForeignProfile:(GLForeignProfile *) newForeignProfile
{
    if (_foreignProfile != newForeignProfile) {
        _foreignProfile = newForeignProfile;
        
        // Update the view.
        [self configureView];
    }
}
- (void)setGreenlightData:(GLGreenlights *) newGreenlightData
{
    if (_greenlightData != newGreenlightData) {
        _greenlightData = newGreenlightData;
        
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

#pragma mark - configureView - Load Greenlights

- (void)configureView
{
    NSLog(@"SETTING GREENLIGHTS");
    
    // Update the user interface for the detail item.
    GLForeignProfile *theForeignProfile = self.foreignProfile;
   // GLForeignProfile *theUserProfile = self.userProfile;
    
    GLGreenlights *theGreenlightData = self.greenlightData;
    
    GLGreenlightAnswers *userGreenlights;
    GLGreenlightAnswers *foreignSyncGreenlights;
    
#pragma mark - Init Greenlight Selectors
    
    switch (DATA_LOAD_MODE) {
        case 0:
            if (theForeignProfile){
                userGreenlights = self.foreignProfile.userGreenlightAnswers;
                foreignSyncGreenlights = self.foreignProfile.foreignGreenlightAnswers;
            }
            break;
        case 1:
            if (theGreenlightData){
                userGreenlights = theGreenlightData.userGreenlights;
                foreignSyncGreenlights = theGreenlightData.foreignSyncGreenlights;
            }
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
        
    // the real greenlights
    [self.buttonILikeTalkingToYou addTarget:self
                                     action:@selector(greenlightClicked:)
                           forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonILikeTalkingToYou, foreignSyncGreenlights.iLikeTalkingToYou, userGreenlights.iLikeTalkingToYou);
    
    [self.buttonHeresMyNumber addTarget:self
                                 action:@selector(greenlightClicked:)
                       forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonHeresMyNumber, foreignSyncGreenlights.heresMyNumber, userGreenlights.heresMyNumber);
    
    [self.buttonHeresMyLastName addTarget:self
                                   action:@selector(greenlightClicked:)
                         forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonHeresMyLastName, foreignSyncGreenlights.heresMyLastName, userGreenlights.heresMyLastName);
    
    [self.buttonCheckOutMyFullProfile addTarget:self
                                         action:@selector(greenlightClicked:)
                               forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonCheckOutMyFullProfile, foreignSyncGreenlights.checkOutMyFullProfile, userGreenlights.checkOutMyFullProfile);
    
    [self.buttonIWantToHookUp addTarget:self
                                 action:@selector(greenlightClicked:)
                       forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonIWantToHookUp, foreignSyncGreenlights.iWantToHookUp, userGreenlights.iWantToHookUp);
    
    [self.buttonLetsGoOnA1On1Date addTarget:self
                                     action:@selector(greenlightClicked:)
                           forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonLetsGoOnA1On1Date, foreignSyncGreenlights.letsGoOnA1On1Date, userGreenlights.letsGoOnA1On1Date);
    
    [self.buttonLetsHangOutWithFriends addTarget:self
                                          action:@selector(greenlightClicked:)
                                forControlEvents:UIControlEventTouchUpInside];
    initGreenlight(self.buttonLetsHangOutWithFriends, foreignSyncGreenlights.letsHangOutWithFriends, userGreenlights.letsHangOutWithFriends);

    
    /*
    if (theForeignProfile){ //&& theUserProfile) {

        // the real greenlights
        [self.buttonILikeTalkingToYou addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonILikeTalkingToYou, self.foreignProfile.foreignGreenlightAnswers.iLikeTalkingToYou, self.foreignProfile.userGreenlightAnswers.iLikeTalkingToYou);
        
        [self.buttonHeresMyNumber addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonHeresMyNumber, self.foreignProfile.foreignGreenlightAnswers.heresMyNumber, self.foreignProfile.userGreenlightAnswers.heresMyNumber);
        
        [self.buttonHeresMyLastName addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonHeresMyLastName, self.foreignProfile.foreignGreenlightAnswers.heresMyLastName, self.foreignProfile.userGreenlightAnswers.heresMyLastName);
        
        [self.buttonCheckOutMyFullProfile addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonCheckOutMyFullProfile, self.foreignProfile.foreignGreenlightAnswers.checkOutMyFullProfile, self.foreignProfile.userGreenlightAnswers.checkOutMyFullProfile);
        
        [self.buttonIWantToHookUp addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonIWantToHookUp, self.foreignProfile.foreignGreenlightAnswers.iWantToHookUp, self.foreignProfile.userGreenlightAnswers.iWantToHookUp);
        
        [self.buttonLetsGoOnA1On1Date addTarget:self
                           action:@selector(greenlightClicked:)
                 forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonLetsGoOnA1On1Date, self.foreignProfile.foreignGreenlightAnswers.letsGoOnA1On1Date, self.foreignProfile.userGreenlightAnswers.letsGoOnA1On1Date);
        
        [self.buttonLetsHangOutWithFriends addTarget:self
                                         action:@selector(greenlightClicked:)
                               forControlEvents:UIControlEventTouchUpInside];
        initGreenlight(self.buttonLetsHangOutWithFriends, self.foreignProfile.foreignGreenlightAnswers.letsHangOutWithFriends, self.foreignProfile.userGreenlightAnswers.letsHangOutWithFriends);
    }
     */

#pragma mark - Init Greenlight Revealed Data
    
    // Set heres my number data visible/hidden
    switch (self.buttonHeresMyNumber.full) {
        case NO:
            switch (self.buttonHeresMyNumber.choice) {
                case YES:
                    [self awaitingGreenlight:self.buttonHeresMyNumber.tag];
                    break;
                case NO:
                    [self hideData:self.buttonHeresMyNumber.tag];
                    break;
                default:
                    NSLog(@"Error: Invalid button.choice loaded for heres my number");
                    break;
            }
            break;
        case YES:
            [self showData:self.buttonHeresMyNumber.tag];
            break;
        default:
            NSLog(@"Error: Invalid button.full loaded for heres my number");
            break;
    }
    
    // Set heres my last name data visible/hidden
    switch (self.buttonHeresMyLastName.full) {
        case NO:
            switch (self.buttonHeresMyLastName.choice) {
                case YES:
                    [self awaitingGreenlight:self.buttonHeresMyLastName.tag];
                    break;
                case NO:
                    [self hideData:self.buttonHeresMyLastName.tag];
                    break;
                default:
                    NSLog(@"Error: Invalid button.choice loaded for heres my last name");
                    break;
            }
            break;
        case YES:
            [self showData:self.buttonHeresMyLastName.tag];
            break;
        default:
            NSLog(@"Error: Invalid button.full loaded for heres my last name");
            break;
    }


}

#pragma mark - Init Greenlight Images and Properties

// initialize greenlight
void initGreenlight(GLGreenlightButton *button, BOOL foreignAnswer, BOOL userAnswer){
    
    // this isnt necessary, but its here just in case, so it doesnt crash if one of the switches defaults
    [button setImage:[UIImage imageNamed:greenlightEmpty] forState:UIControlStateNormal];
    
    switch (foreignAnswer) { // glsync
        case FALSE:
            switch (userAnswer) { // glset (user GL)
                case FALSE:
                    [button setImage:[UIImage imageNamed:greenlightEmpty] forState:UIControlStateNormal];
                    button.choice = FALSE;
                    button.full = NO;
                    break;
                case TRUE:
                    [button setImage:[UIImage imageNamed:greenlightUserClick] forState:UIControlStateNormal];
                    button.choice = TRUE;
                    button.full = NO;
                    break;
                default:
                    NSLog(@"Cannot set selected segment index, invalid user option");
                    break;
            }
            break;
        case TRUE:                  // The user should always have the greenlight set when foreignAnswer (glsync) is set
            switch (userAnswer) { 
                case FALSE:
                    //[button setImage:[UIImage imageNamed:@"greenlightFull.png"] forState:UIControlStateNormal];
                    NSLog(@"Error: User cannot have their glmark unset when the server has the glsync as set. When the user unsets their glmark, glsync should also be unset.");
                    [button setImage:[UIImage imageNamed:greenlightEmpty] forState:UIControlStateNormal];
                    button.choice = FALSE;
                    button.full = NO;
                    break;
                case TRUE:
                    // This should only happen after the greenlight hour
                    [button setImage:[UIImage imageNamed:greenlightFull] forState:UIControlStateNormal];
                    button.choice = TRUE;
                    button.full = YES;
                    break;
                default:
                    NSLog(@"Cannot set greenlight state, invalid user option loaded");
                    break;
            }
            break;
        default:
            NSLog(@"Cannot set greenlight state, invalid foreign option loaded");
            break;
    }
}

#pragma mark - Update Greenlight on Click

- (void) greenlightClicked:(GLGreenlightButton *)button{

    // The outer switch keeps track of what option button the user selected PREVIOUSLY
    switch (button.choice) {
        case FALSE:
            switch (button.full) {  // this switch keeps track of if the button loaded as a fully lit switch
                case YES: // Trying to fully light up a greenlight
                    NSLog(@"Error: You should not be able to make a greenlight become fully lit on click");
                    // because this means either:
                    //  a. You somehow unlit a fully lit greenlight and you want it lit up again
                    //   or
                    //  b. The button.full flag is messed up
                    
                    /*
                    [button setImage:[UIImage imageNamed:greenlightFull] forState:UIControlStateNormal];
                    button.choice = TRUE;
                    
                    // enable phone / last name if button tag 1 or 2
                    [self showData:button.tag];
                    */
                    break;
                case NO: // Regular greenlight UserClick light up case
                    [button setImage:[UIImage imageNamed:greenlightUserClick] forState:UIControlStateNormal];
                    button.choice = TRUE;
                    
                    // Show "Awaiting Greenlight" message for phone / last name if button tag 1 or 2
                    [self awaitingGreenlight:button.tag];
                    
                    break;
                default:
                    NSLog(@"Error: button.full was marked an illegal value previously");
                    break;
            }
            break;
        case TRUE:
            switch (button.full) {
                case YES: // Trying to unlight a fully lit greenlight
                    NSLog(@"Can't unlight a full greenlight!");
                    break;
                case NO: // Trying to unlight a partially lit greenlight
                    [button setImage:[UIImage imageNamed:greenlightEmpty] forState:UIControlStateNormal];
                    button.choice = FALSE;
                    
                    // Completely hide phone / last name if button tag 1 or 2
                    [self hideData:button.tag];
                    break;
                default:
                    NSLog(@"Error: button.full was marked an illegal value previously");
                    break;
            }
            break;
        default:
            NSLog(@"Error: Illegal button choice.");
            break;
    }
}

#pragma mark - Show / Hide Greenlight Revealed Data

// need to add these methods to header, finish methods, and add method calls
-(void) showData:(NSInteger) tag{
    switch (tag) {
        case numberButtonTag:
            // show number and add to contacts
            self.numberLabel.text = self.foreignProfile.phoneNumber;
            self.addToContactsButton.hidden = NO;
            break;
        case lastNameButtonTag:
            // show last name
            self.lastNameLabel.text = self.foreignProfile.lastName;
            break;
        default:
            break;
    }
}

-(void) hideData:(NSInteger) tag{
    switch (tag) {
        case numberButtonTag:
            // hide number and add to contacts
            self.numberLabel.text = @"";
            self.addToContactsButton.hidden = YES;
            break;
        case lastNameButtonTag:
            // hide last name
            self.lastNameLabel.text = @"";
            break;
        default:
            break;
    }
}

-(void) awaitingGreenlight:(NSInteger) tag{
    switch (tag) {
        case numberButtonTag:
            // hide number and add to contacts
            self.numberLabel.text = awaitingGreenlight;
            self.addToContactsButton.hidden = YES;
            break;
        case lastNameButtonTag:
            // hide last name
            self.lastNameLabel.text = awaitingGreenlight;
            break;
        default:
            break;
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addContactButton.layer.cornerRadius = 5.0f;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



////////////////////////////////////////
/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
 */
/////////////////////////////////////////


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Add to Contacts

- (IBAction)addToContactsButtonClick:(id)sender {
    
    NSString *venueFirstName;
    NSString *venuePhone;
    UIImage *venuePicture;
    
    switch (DATA_LOAD_MODE) {
        case 0:
            venueFirstName = self.foreignProfile.name;
            venuePhone = self.foreignProfile.phoneNumber;
            venuePicture = self.foreignProfile.profilePicture;
            break;
        case 1:
            venueFirstName = self.greenlightData.foreignFirstName;
            venuePhone = self.greenlightData.foreignPhoneNumber;
            venuePicture = self.greenlightData.foreignDefaultPhoto;
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
    // Create person record
    ABRecordRef person = ABPersonCreate();
    
    // Set name and other string values
    ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFStringRef) venueFirstName, NULL);
    
    // Set picture
    NSData *dataRef = UIImagePNGRepresentation(venuePicture);
    ABPersonSetImageData(person, (__bridge CFDataRef)dataRef, nil);
    
    // Set phone number
    if (venuePhone)
    {
        ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        NSArray *venuePhoneNumbers = [venuePhone componentsSeparatedByString:@" or "];
        for (NSString *venuePhoneNumberString in venuePhoneNumbers)
            ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFStringRef) venuePhoneNumberString, kABPersonPhoneMainLabel, NULL);
        ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue, nil);
        CFRelease(phoneNumberMultiValue);
    }
    
    // Show the Contacts view controller, this is external
    ABUnknownPersonViewController *controller = [[ABUnknownPersonViewController alloc] init];
    
    // Display in the view controller
    controller.displayedPerson = person;
    controller.allowsAddingToAddressBook = YES;
    
    // current view must have a navigation controller
    [self.navigationController pushViewController:controller animated:YES];
    
    CFRelease(person);
}
@end
