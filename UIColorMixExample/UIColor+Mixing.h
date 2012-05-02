//
//  UIColor+Mixing.h
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Mixing)

+ (UIColor*)rgbMixForColors:(NSArray*)arrayOfColors; // mix as light, additive. fundamentally RGB doesn't mix differently than RYB
//+ (UIColor*)rybMixForColors:(NSArray*)arrayOfColors;
//+ (UIColor*)cmykMixForColors:(NSArray*)arrayOfColors;

@end
