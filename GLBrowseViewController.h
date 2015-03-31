//
//  GLBrowseViewController2.h
//  Greenlight
//


#import <UIKit/UIKit.h>

@class GLBrowseTableView;
@class GLForeignProfileDataController;
@class GLUserDataController;

@class GLForeignProfile;
@class GLBrowse;
@class GLProfile;
@class GLChat;

@interface GLBrowseViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

// declare a data controller property
@property (strong, nonatomic) GLForeignProfileDataController *dataController;
@property (strong, nonatomic) IBOutlet GLBrowseTableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *interestedLabel;

@property (strong, nonatomic) GLForeignProfile *foreignProfilePointer;
@property (strong, nonatomic) GLBrowse *browsePointer;
@property (strong, nonatomic) GLProfile *profile;
@property (strong, nonatomic) GLChat *chat;

- (IBAction)refreshButtonTapped:(id)sender;


@end
