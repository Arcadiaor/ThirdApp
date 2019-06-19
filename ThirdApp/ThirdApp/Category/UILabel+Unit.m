//
//  UILabel+Unit.m
//  OneApp
//
//  Created by leiyong on 2019/4/29.
//  Copyright © 2019 Arcadia. All rights reserved.
//

#import "UILabel+Unit.h"
@implementation UILabel (Unit)

- (UIImage *)pa_imageFromLabel {
    // Create a "canvas" (image context) to draw in.
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);  // high res
    // Make the CALayer to draw in our "canvas".
    [[self layer] renderInContext: UIGraphicsGetCurrentContext()];
    
    // Fetch an UIImage of our "canvas".
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Stop the "canvas" from accepting any input.
    UIGraphicsEndImageContext();
    
    // Return the image.
    return image;
}


@end
