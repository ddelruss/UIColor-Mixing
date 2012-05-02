//
//  CMEViewController.h
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMEViewController : UIViewController

- (IBAction)colorModeSegmentedControlPressed:(UISegmentedControl*)sender;

// Top row:
@property (weak, nonatomic) IBOutlet UILabel *L11;
@property (weak, nonatomic) IBOutlet UILabel *L21;
@property (weak, nonatomic) IBOutlet UILabel *L31;

// Middle row:
@property (weak, nonatomic) IBOutlet UILabel *L12;
@property (weak, nonatomic) IBOutlet UILabel *L22;
@property (weak, nonatomic) IBOutlet UILabel *L32;

// Bottom row:
@property (weak, nonatomic) IBOutlet UILabel *L13;
@property (weak, nonatomic) IBOutlet UILabel *L23;
@property (weak, nonatomic) IBOutlet UILabel *L33;

@end
