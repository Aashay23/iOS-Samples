//
//  GLGreenlightButton.h
//  Greenlight
//


#import <UIKit/UIKit.h>

@interface GLGreenlightButton : UIButton

@property (nonatomic, assign) BOOL choice;
@property (nonatomic, assign) BOOL full;   // this is a flag for if the greenlight is fully lit when loaded. This is important in case the user unlights and relights the greenlight (see the greenlightClicked function in the GLGreenlightViewController)

@end
