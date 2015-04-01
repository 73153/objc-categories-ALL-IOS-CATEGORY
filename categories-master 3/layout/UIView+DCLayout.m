//
//  UIView+DCLayout.m
//  History
//
//  Created by Srikanth Sombhatla on 08/09/12.
//
//

#import "UIView+DCLayout.h"

@implementation UIView (DCLayout)

- (CGRect)dcPlaceThisView:(UIView*)thisView
          afterThisView:(UIView*)afterThisView
            withSpacing:(float)spacing {
    
    CGRect r1 = [afterThisView frame];
    CGRect newFrame = [thisView frame];
    newFrame.origin.y = r1.origin.y + r1.size.height + spacing;
    thisView.frame = newFrame;
    return newFrame;
}

- (float) dcContentHeight {
    float h = 0;
    for (UIView* v in self.subviews) {
        float vh = (v.frame.origin.y + v.frame.size.height);
        if(h < vh)
            h += vh;
    }
    return h;
}
@end
