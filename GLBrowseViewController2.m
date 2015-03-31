//
//  GLBrowseViewController2.m
//  Greenlight
//


#import "GLBrowseViewController2.h"

#import "GLForeignProfileViewController.h"
#import "GLForeignProfileDataController.h"
#import "GLForeignProfile.h"

#import "GLBrowseTableViewCell.h"

#import "GLVerticalSegmentedControl.h"

/*
@interface GLBrowseViewController2 ()

@end
*/


@implementation GLBrowseViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[GLForeignProfileDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // our custom method to return the number of BirdSighting objects in the array
    return [self.dataController countOfList];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ForeignProfileCell";
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    GLBrowseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    GLForeignProfile *foreignProfileAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    //[[cell textLabel] setText:foreignProfileAtIndex.name];
    //[[cell detailTextLabel] setText:foreignProfileAtIndex.age];
    
    //[[cell nameLabel] setText:foreignProfileAtIndex.name];
    [[cell nameAndAgeLabel] setText:[NSMutableString stringWithFormat:@"%@%@%@",foreignProfileAtIndex.name,@", ",foreignProfileAtIndex.age]];
    [[cell locationAndDistanceLabel] setText:[NSMutableString stringWithFormat:@"%@%@%@%@",foreignProfileAtIndex.location,@" (",foreignProfileAtIndex.distance,@" mi)"]];
    // [[cell locationLabel] setText:foreignProfileAtIndex.location]; // IF WE REMOVE THIS, REMOVE THE VALUES IN THE BROWSE TABLE VIEW CELLS
    // [[cell distanceLabel] setText:[NSMutableString stringWithFormat:@"(%@ mi)",foreignProfileAtIndex.distance]]; // IF WE REMOVE THIS, REMOVE THE VALUES IN THE BROWSE TABLE VIEW CELLS
    
    // put the image in the cell
    UIImageView *profilePictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,80,80)];   // set padding and size
    profilePictureImageView.image = foreignProfileAtIndex.profilePictureThumb;                               // set picture to the image view
    profilePictureImageView.contentMode = UIViewContentModeScaleAspectFit;                              // preserve aspect ratio, if necessary
    [cell.contentView addSubview:profilePictureImageView];                                              // add the image view
    
    // programmatically make the segmented control
    ///NSArray *itemArray = [NSArray arrayWithObjects: @"Yes", @"Maybe", @"No", nil];
    NSArray *itemArray = [NSArray arrayWithObjects: @"Greenlight", @"Redlight", nil];
    GLVerticalSegmentedControl *segmentedControl = [[GLVerticalSegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectIntegral(CGRectMake(253, 5, 60, 70)); //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    segmentedControl.frame = CGRectIntegral(segmentedControl.frame);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;//UISegmentedControlStylePlain;
    //  segmentedControl.tintColor = [UIColor blackColor]; // taken care of in the GLVerticalSegmentedControl (and overridden there also)
    segmentedControl.selectedSegmentIndex = -1;
    [cell addSubview:segmentedControl];
    
    // This sets the quote in the cell. If they dont have a quote, dont display the quotation marks
    if ([foreignProfileAtIndex.quote isEqualToString:@""])
        [[cell quoteLabel] setText:[NSMutableString stringWithFormat:@""]];
    else
        [[cell quoteLabel] setText:[NSMutableString stringWithFormat:@"\"%@\"",foreignProfileAtIndex.quote]];
    
    // cell.quoteLabel.font = [UIFont fontWithName:@"Arial-Italic" size:8];
    
    /*
     // add custom URBSegmentedControl
     NSArray *titles = [NSArray arrayWithObjects:[@"Yes" uppercaseString], [@"Maybe" uppercaseString], [@"No" uppercaseString], nil];
     URBSegmentedControl *control = [[URBSegmentedControl alloc] initWithItems:titles];
     control.strokeColor = [UIColor darkGrayColor];
     control.segmentBackgroundColor = [UIColor blackColor];
     control.layoutOrientation = URBSegmentedControlOrientationVertical;
     control.frame = CGRectMake(0, 0, 80, 80);
     //[control addTarget:self action:@selector(handleSelection:) forControlEvents:UIControlEventValueChanged];
     [cell addSubview:control];
     */
    
    return cell;
}

// Manually deselect the cell, since we are using a UIView and UITableView
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}



// this prepares data from the master to be sent to the detail
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"BrowseToProfile"]) {
        GLForeignProfileViewController *detailViewController = [segue destinationViewController];
        
        detailViewController.foreignProfile = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}




@end
