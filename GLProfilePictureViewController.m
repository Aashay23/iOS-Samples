//
//  GLProfilePictureViewController.m
//  Greenlight
//


#import "GLProfilePictureViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+Resize.h"
#import "GLMainDataController.h"

#import "GLHomeTableViewController.h"

@interface GLProfilePictureViewController ()

@end

@implementation GLProfilePictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Set Save button's color (it wouldn't set to its normal color inside storyboard view, so it had to be done programmatically)
    self.uploadButton.tintColor = [UIColor colorWithRed:0.0f/255.0f green:153.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    
    // Give image view a border
   // [self.imageView.layer setBorderColor: [[UIColor darkGrayColor] CGColor]];
   // [self.imageView.layer setBorderWidth: 1.0];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
 //   self.imageView.backgroundColor = [UIColor darkGrayColor];
    
    // Add slider method
    [self.cropSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Give selectPhotoButton a corner radius
    self.selectPhotoButton.layer.cornerRadius = 5.0f;
}

#pragma mark - Crop image
// The image has to be a square, so we need to crop it
- (void)sliderChanged:(UISlider *)slider{
    
    // Move the image with respect to the slider
    NSInteger baseSize;
    NSInteger widthCrop;
    NSInteger heightCrop;
    if (self.originalImage.size.width > self.originalImage.size.height){
        baseSize = self.originalImage.size.height;
        widthCrop = (self.originalImage.size.width - self.originalImage.size.height) * slider.value;
        heightCrop = 0;
    }
    else{
        baseSize = self.originalImage.size.width;
        widthCrop = 0;
        heightCrop = (self.originalImage.size.height - self.originalImage.size.width) * slider.value;
    }
    
    // widthCrop and heightCrop move the image appropriately
    self.modifiedImage = [self.originalImage croppedImage:CGRectMake(widthCrop, heightCrop, baseSize, baseSize)];
    
    // Resize the image down to 640x640
    self.modifiedImage = [self.modifiedImage resizedImage:CGSizeMake(640, 640) interpolationQuality:1];
    
    // Create Thumbnail
    self.thumbnailImage = [self.modifiedImage resizedImage:CGSizeMake(80, 80) interpolationQuality:1];

    // Set image to be displayed in the imageView
    [self.imageView setImage:self.modifiedImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Select Photo
- (IBAction)selectPhotoPushed:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         //UIImagePickerControllerSourceTypeCamera
         UIImagePickerControllerSourceTypePhotoLibrary
         //UIImagePickerControllerSourceTypeSavedPhotosAlbum
         ])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
}


#pragma mark - This executes after the image has been selected from the photo library
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        ///////////////////////////////////////////////////
#pragma mark - Initial image crop and resize
        
        // Make some copies of the image selected
        self.originalImage = [image copy];  // Preserve the original image
        self.modifiedImage = [image copy];  // This will be the image that is edited and uploaded
                
        // Center the image (since we will only see a square of it)
        NSInteger baseSize;     // baseSize is min(width, height)
        NSInteger widthCrop;
        NSInteger heightCrop;
        if (self.originalImage.size.width > self.originalImage.size.height){
            baseSize = self.originalImage.size.height;
            widthCrop = (self.originalImage.size.width - self.originalImage.size.height)/2;
            heightCrop = 0;
        }
        else{
            baseSize = self.originalImage.size.width;
            widthCrop = 0;
            heightCrop = (self.originalImage.size.height - self.originalImage.size.width)/2;
        }
        
        // The widthCrop and heightCrop centers the image
        self.modifiedImage = [self.originalImage croppedImage:CGRectMake(0 + widthCrop, 0 + heightCrop, baseSize, baseSize)];
        
        // Resize the image down to a 640x640 square
        self.modifiedImage = [self.modifiedImage resizedImage:CGSizeMake(640, 640) interpolationQuality:1];

        // Create thumbnail
        self.thumbnailImage = [self.modifiedImage resizedImage:CGSizeMake(80, 80) interpolationQuality:1];
        
        // Set the slider to the middle position (in case the user changed it beforehand
        self.cropSlider.value = 0.5f;
        
        ////////////////////////////////////////////////////////

        // Set it to be the image in the imageView, the rest of this is just the default behavior
        _imageView.image = self.modifiedImage;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

// Default methods for saving the image (I don't think we need this)...
-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

// If the user cancels the picker, then just dismiss the view controller
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//////////////////////////////////////////////

#pragma mark - Save Profile Picture to database

// This is where the database is updated and verified
// This also has the potential to stop the segue from occuring between Compatibility Criteria (save) and Home
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    
#pragma mark - Verify a picture was selected for upload
    // Text field verification for
    if ([identifier isEqualToString: @"ReturnProfilePictureInput"] &&
        self.modifiedImage == nil)
    {
        UIAlertView *errorAlert = [[UIAlertView alloc]
                                   initWithTitle:@"Profile Picture could not be uploaded" message:@"Please select a photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [errorAlert show];
        return NO;
    }
    
    
    switch (DATA_LOAD_MODE) {
        case 0:
            if ([identifier isEqualToString: @"ReturnProfilePictureInput"])
                PROFILE_PICTURE_COMPLETE = YES;
            return YES;
            break;
        case 1:
            if ([identifier isEqualToString: @"ReturnProfilePictureInput"]){
                NSInteger successFailFlag = -1;
                
#pragma mark - STORE TO DATABASE HERE
                successFailFlag = storeProfilePicture(self.modifiedImage, self.thumbnailImage); // that is a made up number, so fill it in with the real id
                
                if (successFailFlag == 1){ // database update fails
                    UIAlertView *errorAlert = [[UIAlertView alloc]
                                               initWithTitle:@"Error" message:@"Failed to Connect to Database" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [errorAlert show];
                    
                    // Manually deselect the highlighted row
                 //   [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
                    return NO;
                }
                else if (successFailFlag == 0){
                    NSLog(@"Database loaded data successfully");
                    PROFILE_PICTURE_COMPLETE = YES;
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

//////////////////




@end
