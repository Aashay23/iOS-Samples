//
//  GLBrowseTableView.m
//  Greenlight
//


#import "GLBrowseTableView.h"

@implementation GLBrowseTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    // move the frame up on the Matches view
    // This is because "Interested In" doesnt exist in the Matches view
    if (self.parent.tabBarController.selectedIndex == 3) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - 20, self.frame.size.width, self.frame.size.height);
    }
}
*/

@end
