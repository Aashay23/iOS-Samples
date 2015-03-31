//
//  GLBrowseViewController2.m
//  Greenlight
//


#import "GLBrowseViewController.h"
#import "GLForeignProfileViewController.h"
#import "GLForeignProfileDataController.h"
#import "GLForeignProfile.h"
#import "GLBrowseTableViewCell.h"
#import "GLVerticalSegmentedControl.h"
#import "GLBrowseTableView.h"
#import "GLUserDataController.h"
#import "GLChatViewController.h"

#import "GLMainDataController.h"
#import "GLBrowse.h"
#import "GLProfile.h"
#import "GLChat.h"

#import <QuartzCore/QuartzCore.h>

/*
@interface GLBrowseViewController2 ()
@end
*/


@implementation GLBrowseViewController

//NSInteger flag = 0;
NSInteger whoToBlock = -1; // This keeps track of which person the user was trying to block

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // self.dataController.tabSelected = self.tabBarController.selectedIndex;
    // self.dataController = [[GLForeignProfileDataController alloc] init];
    /// self.userDataController = [[GLUserDataController alloc] init];
}

#pragma mark - Move View up for Greenlit and Matches

// this re-lays out the subviews before the view appears
- (void)viewDidLayoutSubviews{
    // Move the table view up, covering the place of the "Interested In?" Label
    if (self.tabBarController.selectedIndex == 2 || self.tabBarController.selectedIndex == 3) {
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y - 20, self.tableView.frame.size.width, self.tableView.frame.size.height)];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];    
}

- (void)configureView{
    // Do any additional setup after loading the view.
    self.dataController = [[GLForeignProfileDataController alloc] initWithTabSelected:self.tabBarController.selectedIndex];
    self.dataController = [self.dataController init];
    
#pragma mark - Set Title based on what tab it is in
    
    //  if ([[self parentViewController] isKindOfClass:[GLForeignProfileViewController class]]) {
    if (self.tabBarController.selectedIndex == 1 /*|| flag == 1*/) {
        self.title = @"Potentials";
        /*
        if (flag == 1)
        {
            [self.dataController objectInListAtIndex:0].name = @"Roxy";
        }*/
    }
    else if (self.tabBarController.selectedIndex == 2) {
        self.title = @"Greenlit";
        self.interestedLabel.hidden = YES;
    }
    else if (self.tabBarController.selectedIndex == 3) {
        self.title = @"Matches";
        self.interestedLabel.hidden = YES;
    }
    else{
        NSLog(@"Tab bar controller selected index outside of range; cannot configure correct title.");
    }
    
    NSLog(@"View Loaded");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // our custom method to return the number of ForeignProfile objects in the array
    return [self.dataController countOfList];
}

#pragma mark - Add content to the cells

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ForeignProfileCell";
    
    // Create a cell pointer and a pointer for the foreignProfile at that particular cell index
    GLBrowseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    GLForeignProfile *foreignProfileAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    GLBrowse *browseAtIndex = [self.dataController objectBrowseInListAtIndex:indexPath.row];
    
    // Make the chat button's corners round
    [[[cell chatButton]layer]setCornerRadius:5.0f];
    
    NSDate* birthday;
    NSString* firstName;
    NSInteger distance = 0;
    NSInteger compatibilityPercentage = 0;
    UIImage* profilePictureThumb;
    NSString* quote;
    
    switch (DATA_LOAD_MODE) {
        case 0:{
            birthday = foreignProfileAtIndex.birthday;
            firstName = foreignProfileAtIndex.name;
            distance = [foreignProfileAtIndex.distance intValue];
            compatibilityPercentage = foreignProfileAtIndex.compatibilityPercentage;
            profilePictureThumb = foreignProfileAtIndex.profilePictureThumb;
            quote = foreignProfileAtIndex.quote;
            break;
        }
        case 1:{
            birthday = browseAtIndex.birthdate;
            firstName = browseAtIndex.firstName;
            distance = browseAtIndex.distance;
            compatibilityPercentage = browseAtIndex.compatibilityPercentage;
            profilePictureThumb = browseAtIndex.defaultPhotoThumbnail;
            quote = browseAtIndex.quote;
            break;
        }
        default:{
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
        }
    }
    
    // Give cell an index path property
    cell.indexPath = indexPath.row;
    
    // Convert birthday to an age
    ///NSDate* birthday = foreignProfileAtIndex.birthday;
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:birthday
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    
    // Set cell name, age, distance, and compatibility level
    [[cell nameAndAgeLabel] setText:[NSMutableString stringWithFormat:@"%@%@%d",firstName,@", ",age]];
   // [[cell distanceLabel] setText:[NSMutableString stringWithFormat:@"%d miles",distance]];
   // [[cell compatibilityLabel] setText:[NSMutableString stringWithFormat:@"%d%% compatible",compatibilityPercentage]];
    [[cell distanceLabel] setText:[NSMutableString stringWithFormat:@"%d miles, %d%% compatible", distance, compatibilityPercentage]];
    
    
    // Put the image in the cell
    UIImageView *profilePictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,80,80)];   // set padding and size
    profilePictureImageView.image = profilePictureThumb;                                                // set picture to the image view
    profilePictureImageView.contentMode = UIViewContentModeScaleAspectFit;                              // preserve aspect ratio, if necessary
    [cell.contentView addSubview:profilePictureImageView];                                              // add the image view
    
    // This sets the quote in the cell. If they dont have a quote, dont display the quotation marks
    if ([quote isEqualToString:@""])
        [[cell quoteLabel] setText:[NSMutableString stringWithFormat:@""]];
    else
        [[cell quoteLabel] setText:[NSMutableString stringWithFormat:@"\"%@\"",quote]];

    
#pragma mark - Potentials tab particular code
    
    if (self.tabBarController.selectedIndex == 1) {
    
#pragma mark - This is where the greenlights and redlights are added
        
        NSInteger width = 40;//44;
        NSInteger xposition = 320 - width;
        
        // Greenlight
        UIButton *greenlightButton = [[UIButton alloc] initWithFrame:CGRectIntegral(CGRectMake(xposition - width, 20, width, 44))];
        // Note: it was CGRectMake(267, 25, 35, 35)
        [greenlightButton addTarget:self action:@selector(selectInterested:) forControlEvents:UIControlEventTouchUpInside];
        [greenlightButton setImage:[UIImage imageNamed:@"greenlightEmpty.png"] forState:UIControlStateNormal];
        //greenlightButton.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 3, 3); // when 40x40 images are replaced with 32x32 images uncomment this!
        [cell addSubview:greenlightButton];
        
        // Redlight
        UIButton *redlightButton = [[UIButton alloc] initWithFrame:CGRectIntegral(CGRectMake(xposition, 20, width, 44))];
        // Note: it was CGRectMake(267, 25, 35, 35)
        [redlightButton addTarget:self action:@selector(block:) forControlEvents:UIControlEventTouchUpInside];
        [redlightButton setImage:[UIImage imageNamed:@"redlightEmpty.png"] forState:UIControlStateNormal];
        [cell addSubview:redlightButton];
        
        // Disable the ability to view a profile in Potentials view
        tableView.allowsSelection = NO;
        
        // Hide the chat button (Given the tag 1 in its attributes inspector)
        UIButton *chatButton = (UIButton *)[cell viewWithTag:1];
        chatButton.hidden = YES;
    }
    else if (self.tabBarController.selectedIndex == 2){
    
#pragma mark - Greenlit tab particular code
                
        // Hide the chat button (Given the tag 1 in its attributes inspector)
        UIButton *chatButton = (UIButton *)[cell viewWithTag:1];
        chatButton.hidden = YES;
         
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectIntegral(CGRectMake(264, 20, 40, 40))];
        // note: it was CGRectMake(267, 25, 35, 35)
        [button addTarget:self action:@selector(block:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"redlightEmpty.png"] forState:UIControlStateNormal];
        [cell addSubview:button];
    }
    else if (self.tabBarController.selectedIndex == 3){
        
#pragma mark - Matches tab particular code
   
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectIntegral(CGRectMake(264, 39, 40, 40))];
        // note: it was CGRectMake(267, 40, 35, 35)
        [button addTarget:self action:@selector(block:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"redlightEmpty.png"] forState:UIControlStateNormal];
        [cell addSubview:button];
        
    }
    else{
        NSLog(@"Error: Tab out of range, cannot set up the Potentials / Interested In / Matches View Controllers");
    }
    
    
    return cell;
}


#pragma mark - Greenlight selector here

// This is the selector for the greenlight button
- (void) selectInterested:(UIButton*)button{
    GLBrowseTableViewCell *cellView = (GLBrowseTableViewCell *)button.superview;
    
    GLForeignProfile *foreignProfileAtIndex = [self.dataController objectInListAtIndex:cellView.indexPath];
    GLBrowse *browseAtIndex = [self.dataController objectBrowseInListAtIndex:cellView.indexPath];
    
    
    switch (DATA_LOAD_MODE) {
        case 0:{
            NSLog(@"Interested In clicked for %@",foreignProfileAtIndex.name);
            
            #pragma mark - Remove person from Potentials when greenlit
            [self.dataController removeProfileAtIndex:cellView.indexPath];
            [self.tableView reloadData];
            
            break;
        }
        case 1:{
            NSInteger successFailFlag = -1;
            
            #pragma mark - UPDATE DATABASE HERE - Interested click
            successFailFlag = updateInterestedIn(browseAtIndex.personID);
            
            if (successFailFlag == 1){ // database update fails
                couldNotGreenlightUser(browseAtIndex.firstName);
                NSLog(@"%@ unsuccessfully set interested on database",browseAtIndex.firstName);
            }
            else if (successFailFlag == 0){
                NSLog(@"%@ successfully set interested on database",browseAtIndex.firstName);
                
                #pragma mark - REMOVE USER FROM POTENTIALS HERE
                // Remove user from Potentials here (if we want it to show this automatically w/o refresh)
                #pragma mark - Remove person from Potentials when greenlit
                [self.dataController removeProfileAtIndex:cellView.indexPath];
                [self.tableView reloadData];
                
            }
            else{
                NSLog(@"Error: Invalid successFailFlag value %d",successFailFlag);
            }
            break;
        }
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    
    /*
    if(1){ // database successfully updates
        if (foreignProfileAtIndex.foreignGreenlightAnswers.interestedIn == FALSE){
            // put them in greenlit
            NSLog(@"%@ moved to greenlit",foreignProfileAtIndex.name);

        }
        else{
            // put them in matches
            NSLog(@"%@ moved to matches",foreignProfileAtIndex.name);
        }
    }
    else{
        couldNotGreenlightUser(foreignProfileAtIndex.name);
        NSLog(@"%@ unsuccessfully set interested on database",foreignProfileAtIndex.name);
    }
     */
    
}

#pragma mark - Redlight Selector

// Calls the redlightActionSheet function, this is the selector for the redlight button
- (void) block:(UIButton*)control{
    UIButton *button = (UIButton*)control;
    GLBrowseTableViewCell *cellView = (GLBrowseTableViewCell *)button.superview;
    
    GLForeignProfile *foreignProfileAtIndex = [self.dataController objectInListAtIndex:cellView.indexPath];
    GLBrowse *browseAtIndex = [self.dataController objectBrowseInListAtIndex:cellView.indexPath];

    // Keep track of who to block
    whoToBlock = cellView.indexPath;
    
    switch (DATA_LOAD_MODE) {
        case 0:
            self.foreignProfilePointer = foreignProfileAtIndex;
            [self redlightActionSheet:foreignProfileAtIndex];
            break;
        case 1:
            self.browsePointer = browseAtIndex;
            [self redlightBrowseActionSheet:browseAtIndex];
            break;
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    

}

#pragma mark - Redlight Action Sheet

// Displays the action sheet for Debug GUI mode
- (void)redlightActionSheet:(GLForeignProfile*)foreignProfileAtIndex //Define method to show action sheet
{
    NSString *actionSheetTitle = [NSString stringWithFormat:@"Are you sure you want to permanently block %@?",foreignProfileAtIndex.name];
    NSString *destructiveTitle = @"Block"; //Action Sheet Button Titles
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle
															 delegate:self
													cancelButtonTitle:cancelTitle
											   destructiveButtonTitle:destructiveTitle
													otherButtonTitles:nil];
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}

// Displays the action sheet for normal mode
- (void)redlightBrowseActionSheet:(GLBrowse*)browseAtIndex //Define method to show action sheet
{
    NSString *actionSheetTitle = [NSString stringWithFormat:@"Are you sure you want to permanently block %@?",browseAtIndex.firstName];
    NSString *destructiveTitle = @"Block"; //Action Sheet Button Titles
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle
															 delegate:self
													cancelButtonTitle:cancelTitle
											   destructiveButtonTitle:destructiveTitle
													otherButtonTitles:nil];
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}


#pragma mark - Redlight ActionSheet handler - Redlight updated here

// Action Sheet handler - built in method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    

    if ([buttonTitle isEqualToString:@"Block"]) {
        
        
        switch (DATA_LOAD_MODE) {
            case 0:
                NSLog(@"Starting to block %@",self.foreignProfilePointer.name);
                
                if(1){ // database successfully updated
                    NSLog(@"%@ successfully blocked",self.foreignProfilePointer.name);
                    
                    // remove person from array
                    #pragma mark - Remove person when redlit HERE
                    [self.dataController removeProfileAtIndex:whoToBlock];  // Remove the person from the dataController
                    whoToBlock = -1;                                        // Reset the whoToBlock marker
                    [self.tableView reloadData];                            // Reload the tableView
                }
                else{
                    couldNotBlockUser(self.foreignProfilePointer.name);
                    NSLog(@"%@ unsuccessfully blocked",self.foreignProfilePointer.name);
                }
                
                break;
            case 1:
                NSLog(@"Starting to block %@",self.browsePointer.firstName);
                
                NSInteger successFailFlag = -1;
                
                #pragma mark - UPDATE DATABASE HERE - Interested click
                successFailFlag = updateBlocked(self.browsePointer.personID); //  these are made up numbers, so fill them in with real ids
                
                if (successFailFlag == 1){ // database update fails
                    couldNotBlockUser(self.browsePointer.firstName);
                    NSLog(@"%@ unsuccessfully blocked on database",self.browsePointer.firstName);
                }
                else if (successFailFlag == 0){
                    NSLog(@"%@ successfully blocked on database",self.browsePointer.firstName);
                    
                    #pragma mark - REMOVE USER FROM POTENTIALS HERE
                    // Remove user from Potentials here (if we want it to show this automatically w/o refresh)
                    #pragma mark - Remove person when redlit HERE
                    [self.dataController removeProfileAtIndex:whoToBlock];  // Remove the person from the dataController
                    whoToBlock = -1;                                        // Reset the whoToBlock marker
                    [self.tableView reloadData];                            // Reload the tableView
                }
                else{
                    NSLog(@"Error: Invalid successFailFlag value %d",successFailFlag);
                }
                
                break;
            default:
                NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
                break;
        }
    }
    else if ([buttonTitle isEqualToString:@"Cancel"]) {
        switch (DATA_LOAD_MODE) {
            case 0:
                NSLog(@"Canceled Blocking %@",self.foreignProfilePointer.name);
                break;
            case 1:
                NSLog(@"Canceled Blocking %@",self.browsePointer.firstName);
                break;
            default:
                NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
                break;
        }
    }
    else{
        NSLog(@"Error: Unknown Action Sheet button title clicked");
    }
    

}

#pragma mark - Alert Views for problem accessing server

// Alerts for when the server cant update
void couldNotBlockUser(NSString * name){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not contact the server"
                                                    message:[NSString stringWithFormat:@"Could not block %@",name]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
void couldNotGreenlightUser(NSString *name){
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not contact the server"
                                                    message:[NSString stringWithFormat:@"Could not greenlight %@",name]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Selecting a cell causes this action

- (void)viewDidAppear:(BOOL)animated
{     
    [super viewDidAppear:animated];
    
    // Manually deselect the cell, since we are using a UIView and UITableView
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    switch (DATA_LOAD_MODE) {
        case 0:{
         //   CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
         //   NSInteger rowSelected= [self.tableView indexPathForRowAtPoint:buttonPosition].row;
         //   NSLog(@"Row: %i", rowSelected);
            return YES;
            break;
        }
        case 1:{
            
            if ([identifier isEqualToString: @"BrowseToProfile"]){
                NSInteger successFailFlag = -1;
                
                self.profile = [GLProfile alloc];
                

                NSInteger foreignID = [self.dataController objectBrowseInListAtIndex:[self.tableView indexPathForSelectedRow].row].personID;
               
                
                #pragma mark - LOAD FROM DATABASE HERE
                successFailFlag = loadForeignProfileData(foreignID, self.profile);
                
                
                if (successFailFlag == 1){ // database update fails
                    UIAlertView *errorAlert = [[UIAlertView alloc]
                                               initWithTitle:@"Error" message:@"Failed to Connect to Database" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [errorAlert show];
                    
                    // Manually deselect the highlighted row
                    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
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
            
            
            if ([identifier isEqualToString: @"BrowseToChat"]){
                NSInteger successFailFlag = -1;
                
                self.chat = [GLChat alloc];
                
                CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
                NSInteger rowSelected= [self.tableView indexPathForRowAtPoint:buttonPosition].row;
                NSInteger foreignID = [self.dataController objectBrowseInListAtIndex:rowSelected].personID;
                NSString *firstName = [self.dataController objectBrowseInListAtIndex:rowSelected].firstName;
                
                NSLog(@"Row selected: %@",firstName);
                
                #pragma mark - LOAD FROM DATABASE HERE
                // NOTE: If we are using some other method to get particular profiles other than by using IDs here
                //          then this would have to be a different function
                
                successFailFlag = loadChatData(foreignID, self.chat, firstName); // that is a made up number, so fill it in with the real id
                
                if (successFailFlag == 1){ // database update fails
                    UIAlertView *errorAlert = [[UIAlertView alloc]
                                               initWithTitle:@"Error" message:@"Failed to Connect to Database" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [errorAlert show];
                    
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
        }
        default:
            NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
            break;
    }
    return YES;
}


#pragma mark - Prepare for Segue

// Prepare data from the master to be sent to the detail
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"BrowseToProfile"]) {
/*
        GLForeignProfileViewController *profileViewController = [segue destinationViewController];
        profileViewController.foreignProfile = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
  */      
        GLForeignProfileViewController *profileViewController = [segue destinationViewController];
        
        switch (DATA_LOAD_MODE) {
            case 0:
                profileViewController.foreignProfile = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
                break;
            case 1:
                profileViewController.profile = self.profile; // This value is set in shouldPerformSegueWithIdentifier
                break;
            default:
                NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
                break;
        }  
    }
    
    if ([[segue identifier] isEqualToString:@"BrowseToChat"]) {
       /*
        GLChatViewController *chatViewController = [segue destinationViewController];
        chatViewController.foreignProfile = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        */
        GLChatViewController *chatViewController = [segue destinationViewController];
        
        switch (DATA_LOAD_MODE) {
            case 0:{
                CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
                NSInteger rowSelected= [self.tableView indexPathForRowAtPoint:buttonPosition].row;
                chatViewController.foreignProfile = [self.dataController objectInListAtIndex:rowSelected];
                break;
            }
            case 1:
                chatViewController.chat = self.chat;
                break;
            default:
                NSLog(@"Error: Invalid DATA_LOAD_MODE %d",DATA_LOAD_MODE);
                break;
        }
    }
}

- (IBAction)refreshButtonTapped:(id)sender {
   
    //flag = 1;
///    NSLog(@"Refresh button tapped");
    
    // Reload data from the database
    //[self viewDidLoad];
    [self configureView];
    
    // Reload the tableView
    [self.tableView reloadData];
}




@end






















