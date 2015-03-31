//
//  GLGreenlightViewController.h
//  Greenlight
//


#import <UIKit/UIKit.h>
#import "GLGreenlightButton.h"

@class GLForeignProfile;
@class GLGreenlights;

@interface GLGreenlightViewController : UITableViewController

//@property (strong, nonatomic) GLForeignProfile *userProfile;
@property (strong, nonatomic) GLForeignProfile *foreignProfile;
@property (strong, nonatomic) GLGreenlights *greenlightData;
 
// Greenlight buttons
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonILikeTalkingToYou;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonHeresMyNumber;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonHeresMyLastName;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonCheckOutMyFullProfile;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonIWantToHookUp;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonLetsGoOnA1On1Date;
@property (weak, nonatomic) IBOutlet GLGreenlightButton *buttonLetsHangOutWithFriends;

// Greenlight revealed info labels and buttons
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToContactsButton;
- (IBAction)addToContactsButtonClick:(id)sender;

- (void)configureView;
@property (weak, nonatomic) IBOutlet UIButton *addContactButton;


@end












