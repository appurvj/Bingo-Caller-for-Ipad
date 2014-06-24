//
//  NumberScreen.h
//  Trial
//
//  Created by Amrith Akula on 4/18/13.
//  Copyright (c) 2013 Amrith Akula. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberScreen : UIViewController
{
    UINavigationController* numberNavigationController;
    NSMutableArray * _numbers;
    int counter;
}
- (IBAction)startOver:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *NumberDisplay;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigaionBar;
@end
