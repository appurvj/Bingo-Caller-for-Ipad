//
//  CalledNumbers.m
//  Trial
//
//  Created by Amrith Akula on 4/18/13.
//  Copyright (c) 2013 Amrith Akula. All rights reserved.
//

#import "CalledNumbers.h"
#import "PrevNumbers.h"
@interface CalledNumbers ()

@end

@implementation CalledNumbers
@synthesize shuffledNumbers;
@synthesize countValue;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableNames = [[NSArray alloc] initWithObjects:@"Last 10 Calls",@"B", @"I",@"N", @"G",@"O", nil];
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(goBackToNumbers)];
    self.navigationItem.rightBarButtonItem = backButton;
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) goBackToNumbers
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [tableNames objectAtIndex:indexPath.row];
    if(indexPath.row > 0)
        cell.textLabel.font = [UIFont fontWithName:@"Optima-Regular" size:100];
    else
        cell.textLabel.font = [UIFont fontWithName:@"Optima-Regular" size:100];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSMutableArray* numbersToDisplay = [[NSMutableArray alloc] init];
    if(indexPath.row==0)
    {
        for(int i = (countValue-10)>=0?countValue-10:0;i<countValue;i++)
        {
            [numbersToDisplay addObject:[shuffledNumbers objectAtIndex:i]];
        }
    }else
    {
        for(int i =0; i < countValue; i++)
        {
            if([[shuffledNumbers objectAtIndex:i] characterAtIndex:0] == [[tableNames objectAtIndex:indexPath.row] characterAtIndex:0])
                [numbersToDisplay addObject:[shuffledNumbers objectAtIndex:i]];
        }
    }
    PrevNumbers* showNumbers = [[PrevNumbers alloc] init];
    showNumbers.displayNumbers = indexPath.row > 0?(NSMutableArray*)[numbersToDisplay sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]:numbersToDisplay;
    
    [self.navigationController pushViewController:showNumbers animated:YES];

}

@end
