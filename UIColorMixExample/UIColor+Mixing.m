//
//  UIColor+Mixing.m
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIColor+Mixing.h"

@implementation UIColor (Mixing)

+ (UIColor*)rgbMixForColors:(NSArray*)arrayOfColors {
    UIColor *resultColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    
    CGFloat c1, c2, c3, c1Total, c2Total, c3Total, notUsed; // 
    int count = [arrayOfColors count];
        
    if (count == 0) return resultColor;
    if (count == 1) return [[arrayOfColors lastObject] copy];
        
    c1Total = c2Total = c3Total = 0;

    for (UIColor* aColor in arrayOfColors) {
        [aColor getRed:&c1 green:&c2 blue:&c3 alpha:&notUsed];
        
        c1Total += c1;
        c2Total += c2;
        c3Total += c3;
    }    
    
    // optionally adjust brightness based on average of highest value (not total).
    //    br = mTotal/(count*255.0);
        
    // consider these alternatives...
    //    c1 = c1Total*br/count;
    //    c2 = c2Total*br/count;
    //    c3 = c3Total*br/count;
    //    c1 = c1Total/count;
    //    c2 = c2Total/count;
    //    c3 = c3Total/count;
    c1 = c1Total/sqrt((sqrt(count-1))); // works great for additive light
    c2 = c2Total/sqrt((sqrt(count-1)));
    c3 = c3Total/sqrt((sqrt(count-1)));
    //    c1 = c1Total*m1/255;
    //    c2 = c2Total*m2/255;
    //    c3 = c3Total*m3/255;
        
    // average whiteness and add into final color
    //    w1 = wTotal/count;
    
    //    c1 += w1;
    //    c2 += w1;
    //    c3 += w1;
    
    //    NSLog(@"Ending color is %i, %i, %i",c1, c2, c3);
    
    resultColor = [UIColor colorWithRed:c1 green:c2 blue:c3 alpha:1.0];        
    
    return resultColor;
}
//+ (UIColor*)rybMixForColors:(NSArray*)arrayOfColors;
//+ (UIColor*)cmykMixForColors:(NSArray*)arrayOfColors;


@end
