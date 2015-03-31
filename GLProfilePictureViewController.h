//
//  GLProfilePictureViewController.h
//  Greenlight
//


#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GLProfilePictureViewController : UIViewController <UIImagePickerControllerDelegate,
UINavigationControllerDelegate>


@property BOOL newMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)selectPhotoPushed:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *uploadButton;
@property (weak, nonatomic) IBOutlet UIButton *selectPhotoButton;
@property (weak, nonatomic) IBOutlet UISlider *cropSlider;

@property (copy, nonatomic) UIImage *originalImage;
@property (copy, nonatomic) UIImage *modifiedImage;
@property (copy, nonatomic) UIImage *thumbnailImage;

@end
