//
//  CMEViewController.m
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMEViewController.h"

@implementation CMEViewController
@synthesize L11;
@synthesize L12;
@synthesize L13;
@synthesize L21;
@synthesize L22;
@synthesize L23;
@synthesize L31;
@synthesize L32;
@synthesize L33;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setL11:nil];
    [self setL12:nil];
    [self setL13:nil];
    [self setL21:nil];
    [self setL22:nil];
    [self setL23:nil];
    [self setL31:nil];
    [self setL32:nil];
    [self setL33:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (IBAction)colorModeSegmentedControlPressed:(id)sender {
}
@end
