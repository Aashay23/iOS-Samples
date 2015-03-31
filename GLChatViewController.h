//
//  GLChatViewController.h
//  Greenlight
//


#import <UIKit/UIKit.h>

#import "GLForeignProfile.h"

@class GLForeignProfile;

@class GLChat;
@class GLGreenlights;

@interface GLChatViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *greenlightsSubview;
- (IBAction)greenlightsButton:(id)sender;

@property (strong, nonatomic) GLForeignProfile *foreignProfile;
@property (strong, nonatomic) GLChat *chat;

@property (strong, nonatomic) GLGreenlights *greenlightData;

@property (weak, nonatomic) IBOutlet UILabel *foreignNameLabel;



@end
