//
//  UIView+DCLayout.h
//  History
//
//  Created by Srikanth Sombhatla on 08/09/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (DCLayout)
- (CGRect)dcPlaceThisView:(UIView*)thisView afterThisView:(UIView*)afterThisView withSpacing:(float)spacing;
- (float)dcContentHeight;
@end
