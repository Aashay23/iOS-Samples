//
//  GLBirthdayViewController.h
//  Greenlight


#import <UIKit/UIKit.h>

@interface GLBirthdayViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSString *dateText;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel2;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthdayDatePicker;

@end
