//
//  CMEViewController.m
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "CMEViewController.h"
#import "UIColor+Mixing.h"
#import <QuartzCore/QuartzCore.h>

@implementation CMEViewController
@synthesize colorModeSegmentedControl;
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

- (void)recolorLabelsRGB {
    self.L21.layer.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L12.layer.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L23.layer.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L32.layer.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L22.layer.backgroundColor = [UIColor rgbMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
}

- (void)recolorLabelsRYB {
    self.L21.layer.backgroundColor = [UIColor rybMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L12.layer.backgroundColor = [UIColor rybMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L23.layer.backgroundColor = [UIColor rybMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L32.layer.backgroundColor = [UIColor rybMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L22.layer.backgroundColor = [UIColor rybMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
}

- (void)recolorLabelsCMYK {
    self.L21.layer.backgroundColor = [UIColor cmykMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L12.layer.backgroundColor = [UIColor cmykMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L23.layer.backgroundColor = [UIColor cmykMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L32.layer.backgroundColor = [UIColor cmykMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
    self.L22.layer.backgroundColor = [UIColor cmykMixForColors:[NSArray arrayWithObjects:
                                                         [UIColor colorWithCGColor:self.L11.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L13.layer.backgroundColor], 
                                                         [UIColor colorWithCGColor:self.L31.layer.backgroundColor],
                                                         [UIColor colorWithCGColor:self.L33.layer.backgroundColor], 
                                                         nil]].CGColor;
}

- (void)recolorLabels {
    [UIView animateWithDuration:.5 animations:^{
        switch (self.colorModeSegmentedControl.selectedSegmentIndex) {
            case 0:
                [self recolorLabelsRGB];
                break;
            case 1:
                [self recolorLabelsRYB];
                break;
            case 2:
                [self recolorLabelsCMYK];
                break;
        }
    }];
}

- (void)randomL11 {
    self.L11.layer.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0].CGColor;
}
- (void)randomL31 {
    self.L31.layer.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0].CGColor;
}
- (void)randomL13 {
    self.L13.layer.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0].CGColor;
}
- (void)randomL33 {
    self.L33.layer.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                               green:(arc4random() % 256) / 255.0
                                                blue:(arc4random() % 256) / 255.0
                                               alpha:1.0].CGColor;
}

- (void)labelTapped:(UITapGestureRecognizer*)sender {
    [UIView animateWithDuration:.5 animations:^{
    if (sender.view == self.L11 ||
        sender.view == self.L31 ||
        sender.view == self.L13 ||
        sender.view == self.L33) {
        sender.view.layer.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 
                                                      green:(arc4random() % 256) / 255.0
                                                       blue:(arc4random() % 256) / 255.0
                                                      alpha:1.0].CGColor;
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
    }];
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
    [self setColorModeSegmentedControl:nil];
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
