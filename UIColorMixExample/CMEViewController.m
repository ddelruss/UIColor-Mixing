//
//  CMEViewController.m
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMEViewController.h"
#import "UIColor+Mixing.h"

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

- (void)recolorLabels {
    self.L21.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         self.L11.backgroundColor,
                                                         self.L31.backgroundColor, 
                                                         nil]];
    self.L12.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         self.L11.backgroundColor,
                                                         self.L13.backgroundColor, 
                                                         nil]];
    self.L23.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         self.L13.backgroundColor,
                                                         self.L33.backgroundColor, 
                                                         nil]];
    self.L32.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         self.L31.backgroundColor,
                                                         self.L33.backgroundColor, 
                                                         nil]];
    self.L22.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         self.L11.backgroundColor,
                                                         self.L13.backgroundColor, 
                                                         self.L31.backgroundColor,
                                                         self.L33.backgroundColor, 
                                                         nil]];
}

- (void)randomL11 {
    self.L11.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0];
}
- (void)randomL31 {
    self.L31.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0];
}
- (void)randomL13 {
    self.L13.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0];
}
- (void)randomL33 {
    self.L33.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0];
}

- (void)labelTapped:(UITapGestureRecognizer*)sender {
    if (sender.view == self.L11 ||
        sender.view == self.L31 ||
        sender.view == self.L13 ||
        sender.view == self.L33) {
        sender.view.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                                      green:(arc4random() % 256) / 255.0
                                                       blue:(arc4random() % 256) / 255.0
                                                      alpha:1.0];
    } else if (sender.view == self.L12) {
        [self randomL11];
        [self randomL13];
    } else if (sender.view == self.L21) {
        [self randomL11];
        [self randomL31];
    } else if (sender.view == self.L23) {
        [self randomL13];
        [self randomL33];        
    } else if (sender.view == self.L32) {
        [self randomL31];
        [self randomL33];
    } else if (sender.view == self.L22) {
        [self randomL11];
        [self randomL13];
        [self randomL31];
        [self randomL33];        
    }
    [self recolorLabels];
}

- (void)viewDidLoad {
    [self.L11 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L12 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L13 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];

    [self.L21 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L22 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L23 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];

    [self.L31 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L32 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];
    [self.L33 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)]];

    [self randomL11];
    [self randomL13];
    [self randomL31];
    [self randomL33];
    [self recolorLabels];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)colorModeSegmentedControlPressed:(UISegmentedControl*)sender {
    NSLog(@"colorMode is now %i.",sender.selectedSegmentIndex);
    [self recolorLabels];
}
@end
