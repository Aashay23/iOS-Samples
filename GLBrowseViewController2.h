//
//  GLBrowseViewController2.h
//  Greenlight
//


#import <UIKit/UIKit.h>

@class GLForeignProfileDataController;

@interface GLBrowseViewController2 : UIViewController <UITableViewDelegate, UITableViewDataSource>

// declare a data controller property
@property (strong, nonatomic) GLForeignProfileDataController *dataController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
