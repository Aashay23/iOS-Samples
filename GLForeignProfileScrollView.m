//
//  GLForeignProfileScrollView.m
//  Greenlight
//


#import "GLForeignProfileScrollView.h"

@implementation GLForeignProfileScrollView

@synthesize endOfPageMarker;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // This changes the content size of the scroll view in the browse window so that it dynamically changes depending on the size of the user content.
    // The height is the only difference.
    self.contentSize = CGSizeMake(self.frame.size.width, endOfPageMarker.frame.origin.y);
}




@end
