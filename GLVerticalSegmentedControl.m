//
//  GLVerticalSegmentedControl.m
//  Greenlight
//


#import "GLVerticalSegmentedControl.h"

@implementation GLVerticalSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code        
    }
    return self;
}


// This makes the segmented control vertical:

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //self.transform = CGAffineTransformMakeScale(.8f, .8f);
        
    self.transform = CGAffineTransformMakeRotation(M_PI / 2.0);

    self.tintColor= [UIColor darkGrayColor];
    
    
    // Drawing code
    NSArray *arr = [self subviews];
    for (int i = 0; i < [arr count]; i++) {
        UIView *v = (UIView*) [arr objectAtIndex:i];
        NSArray *subarr = [v subviews];
        for (int j = 0; j < [subarr count]; j++) {
            if ([[subarr objectAtIndex:j] isKindOfClass:[UILabel class]]) {
                UILabel *l = (UILabel*) [subarr objectAtIndex:j];
                l.transform = CGAffineTransformMakeRotation(- M_PI / 2.0); //do the reverse of what the transform did
                [l setFrame:CGRectIntegral(l.frame)];   // this basically converts its position to an integer so it isnt blurry
            }
        }
    }
    
    
}


@end
