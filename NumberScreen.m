//
//  NumberScreen.m
//  Trial
//
//  Created by Amrith Akula on 4/18/13.
//  Copyright (c) 2013 Amrith Akula. All rights reserved.
//

#import "NumberScreen.h"
#import "CalledNumbers.h"

@interface NumberScreen ()

@end

@implementation NumberScreen
@synthesize NumberDisplay;
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
    // Do any additional setup after loading the view from its nib.
    _numbers = [[NSMutableArray alloc] init];
    [self populateNumbers];
    [self shuffle];
    NumberDisplay.font = [UIFont fontWithName:@"Optima-Regular" size:275];
    NumberDisplay.text = [_numbers objectAtIndex:counter++];
    NumberDisplay.textAlignment = NSTextAlignmentCenter;
    UISwipeGestureRecognizer * leftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showNextNumber)];
    [leftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:leftGesture];
    UISwipeGestureRecognizer* rightGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(goToTable)];
    [rightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:rightGesture];
    
}

-(void) showNextNumber
{
    if(counter < 75){
        NumberDisplay.text = [_numbers objectAtIndex:counter++];
    }
    else{
        NumberDisplay.font = [[NumberDisplay font] fontWithSize:100];
        NumberDisplay.text = @"Game Over!";
    }
}

-(void) goToTable
{
    CalledNumbers* calledNumbersTable = [[CalledNumbers alloc] init];
    calledNumbersTable.shuffledNumbers = _numbers;
    calledNumbersTable.countValue = counter;
    numberNavigationController = [[UINavigationController alloc] initWithRootViewController:calledNumbersTable];
    [self presentViewController:numberNavigationController animated:YES completion:nil];
    //[numberNavigationController.navigationController pushViewController:calledNumbersTable animated:YES];
    //[self presentViewController:calledNumbersTable animated:YES completion:nil];
}

- (void) populateNumbers
{
    for(int i =0; i < 75; i++)
    {
        switch(i/15)
        {
            case 0: [_numbers addObject:[[NSString alloc] initWithFormat:@"B-%d",i+1]];
                     break;
            case 1: [_numbers addObject:[[NSString alloc] initWithFormat:@"I-%d",i+1]];
                     break;
            case 2: [_numbers addObject:[[NSString alloc] initWithFormat:@"N-%d",i+1]];
                     break;
            case 3: [_numbers addObject:[[NSString alloc] initWithFormat:@"G-%d",i+1]];
                     break;
            case 4: [_numbers addObject:[[NSString alloc] initWithFormat:@"O-%d",i+1]];
                     break;                     
        }
    }
}
                     
-(void) shuffle
{
    for(int i = 0; i < 75; i++)
    {
        int replacementIndex = arc4random()%75;
        NSString *replaceStr = [_numbers objectAtIndex:replacementIndex];
        [_numbers replaceObjectAtIndex:replacementIndex withObject:[_numbers objectAtIndex:i]];
        [_numbers replaceObjectAtIndex:i withObject:replaceStr];
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startOver:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
