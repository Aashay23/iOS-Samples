//
//  GLBrowseTableViewCell.h
//  Greenlight
//


#import <UIKit/UIKit.h>

@class GLForeignProfile;

@interface GLBrowseTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameAndAgeLabel;
@property (nonatomic, weak) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *compatibilityLabel;

@property (nonatomic, weak) IBOutlet UILabel *quoteLabel;
@property (nonatomic, assign) NSInteger indexPath;
@property (weak, nonatomic) IBOutlet UIButton *chatButton;

@end
