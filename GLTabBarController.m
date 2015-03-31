//
//  GLTabBarController.m
//  Greenlight
//


#import "GLTabBarController.h"

@interface GLTabBarController ()

@end

@implementation GLTabBarController

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
    
#pragma mark - Set Tab names for Potentials, Greenlit, and Matches
    
    [[self.viewControllers objectAtIndex:1] setTitle:@"Potentials"];
    [[self.viewControllers objectAtIndex:2] setTitle:@"Greenlit"];
    [[self.viewControllers objectAtIndex:3] setTitle:@"Matches"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
