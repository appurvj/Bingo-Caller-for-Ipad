//
//  ViewController.m
//  Trial
//
//  Created by Amrith Akula on 4/18/13.
//  Copyright (c) 2013 Amrith Akula. All rights reserved.
//

#import "ViewController.h"
#import "NumberScreen.h"
@interface ViewController ()
{
    
}
@end

@implementation ViewController
@synthesize RITLogo;
@synthesize startButtonName;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSData *dat= [[NSData alloc] initWithContentsOfFile:@"RIT-Logo.png"];
    UIImage *logo = [UIImage imageNamed:@"tiger_walking_rit_color.jpg"];
    RITLogo.image=logo;
	// Do any additional setup after loading the view, typically from a nib.
    
    startButtonName.titleLabel.font = [UIFont fontWithName:@"TimesNewRomanPSMT" size:60];
    [self.startButtonName setBackgroundColor:[UIColor orangeColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartButton:(id)sender {
    NumberScreen * numberScreen = [[NumberScreen alloc] init];
    [self presentViewController:numberScreen animated:YES completion:nil];
}
@end
