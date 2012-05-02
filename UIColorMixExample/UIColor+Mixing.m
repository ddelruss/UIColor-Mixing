//
//  UIColor+Mixing.m
//  UIColorMixExample
//
//  Created by Damien Del Russo on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIColor+Mixing.h"

@implementation UIColor (Mixing)

+ (UIColor*)rybColorWithRed:(CGFloat)red yellow:(CGFloat)yellow blue:(CGFloat)blue alpha:(CGFloat)alpha {
    
    float r, y, b, g, w, my, mg, n;
    r = red;
    y = yellow;
    b = blue;
    
    // remove whiteness
    w = MIN(r, MIN(y,b));
    r -= w;
    y -= w;
    b -= w;
    
    my = MAX(r, MAX(y,b));
    
    // Get the green out of the yellow and blue
    g = MIN(y, b);
    y -= g;
    b -= g;
    
    if (b && g) {
        b *= 2.0;
        g *= 2.0;
    }
    
    // Redistribute the remaining yellow.
    r += y;
    g += y;
    
    // Normalize to values.
    mg = MAX(r, MAX(g, b));
    if (mg) {
        n = my / mg;
        r *= n;
        g *= n;
        b *= n;
    }
    
    // Add the white back in.
    r += w;
    g += w;
    b += w;

    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

- (void)rybGetRed:(CGFloat*)red yellow:(CGFloat*)yellow blue:(CGFloat*)blue alpha:(CGFloat*)alpha {
    // algorithm from http://www.insanit.net/tag/rgb-to-ryb/

    CGFloat r, g, b, w, y, mg, my, n, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    // remove whiteness
    w = MIN(r, MIN(g,b));
    r -= w;
    g -= w;
    b -= w;
    
    mg = MAX(r, MAX(g,b));
    
    // remove yellow
    y = MIN(r,g);
    r -= y;
    g -= y;
    
    // if both blue and green then cut in half to preserve range
    if (b && g) {
        b /= 2.0;
        g /= 2.0;
    }
    
    // redistribute the green
    y += g;
    b += g;
    
    // normalize to values
    my = MAX(r, MAX(y, b));
    if (my) {
        n = mg / my;
        r *= n;
        y *= n;
        b *= n;
    }
    
    // add back in white
    r += w;
    y += w;
    b += w;

    if (red) *red = r;
    if (yellow) *yellow = y;
    if (blue) *blue = b;
    if (alpha) *alpha = a;
    NSLog(@"rybGetRed, ending values are %f, %f, %f, %f.",*red, *yellow, *blue, *alpha);
}

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
    //    br = mTotal/count;
        
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
    //    c1 = c1Total*m1;
    //    c2 = c2Total*m2;
    //    c3 = c3Total*m3;
        
    // average whiteness and add into final color
    //    w1 = wTotal/count;
    
    //    c1 += w1;
    //    c2 += w1;
    //    c3 += w1;
    
    //    NSLog(@"Ending color is %i, %i, %i",c1, c2, c3);
    
    resultColor = [UIColor colorWithRed:c1 green:c2 blue:c3 alpha:1.0];        
    
    return resultColor;
}

+ (UIColor*)rybMixForColors:(NSArray*)arrayOfColors {
    
    CGFloat c1, c2, c3, c1Total, c2Total, c3Total, notUsed; // 
    int count = [arrayOfColors count];
    float br;
    
    if (count == 0) return [UIColor blackColor];
    if (count == 1) return [[arrayOfColors lastObject] copy];
    
    c1Total = c2Total = c3Total = 0;
    for (UIColor* aColor in arrayOfColors) {
        [aColor rybGetRed:&c1 yellow:&c2 blue:&c3 alpha:&notUsed];
                
        c1Total += c1;
        c2Total += c2;
        c3Total += c3;
    }    

    br = c1Total/count;
    c1 = c1Total/sqrt((sqrt(count-br))); // still a little biased towards additive, but pretty good.
    br = c2Total/count;
    c2 = c2Total/sqrt((sqrt(count-br)));
    br = c2Total/count;
    c3 = c3Total/sqrt((sqrt(count-br)));
    
    return [UIColor rybColorWithRed:c1 yellow:c2 blue:c3 alpha:1.0];
}

//+ (UIColor*)cmykMixForColors:(NSArray*)arrayOfColors;


@end
