//
//  GLBirthdayViewController.m
//  Greenlight


#import "GLBirthdayViewController.h"

@interface GLBirthdayViewController ()
- (void)configureView;
@end

@implementation GLBirthdayViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)setDateText:(NSString *) newDateText
{
    if (_dateText != newDateText) {
        _dateText = newDateText;
        
        // Update the view.
        /*The configureView method (which is called in both the new setSighting method and the default viewDidLoad method) updates the UI of the detail scene with specific information. Edit this method so that it updates the detail scene with data from the selected BirdSighting object.*/
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    /*
     if (self.detailItem) {
     self.detailDescriptionLabel.text = [self.detailItem description];
     }*/
    // Update the user interface for the detail item.
    
    ///GLForeignProfile *theUserProfile = self.userProfile;
    NSString *theDateText = self.dateText;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if (theDateText) {
        self.birthdayLabel2.text = theDateText;//[theDateText copy];
        /*
        self.birthdayLabel.text = [formatter stringFromDate:(NSDate *)theUserProfile.birthday];
        self.locationLabel.text = theUserProfile.location;
        
        self.quoteTextField.text = theUserProfile.quote;
        self.aboutMeTextView.text = theUserProfile.aboutMe;
        self.thingsILikeTextView.text = theUserProfile.thingsILike;
        */
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
