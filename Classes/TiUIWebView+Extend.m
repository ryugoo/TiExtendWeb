//
//  TiUIWebView+Extend.m
//  TiExtendWeb
//
//  Created by ryugoo on 2013/05/18.
//
//

#import "TiUIWebView+Extend.h"
#import "TiUtils.h"

@implementation TiUIWebView (TiUIWebView_Extend)

- (void)setNormalScrollSpeed_:(id)args
{
    BOOL normalSpeed = [TiUtils boolValue:args def:NO];
    if (normalSpeed == YES)
    {
        // Same TableView, ScrollView scroll speed.
        [[self scrollview] setDecelerationRate:UIScrollViewDecelerationRateNormal];
    }
    else
    {
        // Default scroll speed.
        [[self scrollview] setDecelerationRate:UIScrollViewDecelerationRateFast];
    }
}

- (void)setRemoveShadow_:(id)args
{
    BOOL removeFlag = [TiUtils boolValue:args def:NO];
    if (removeFlag == YES)
    {
        for (UIView *shadowView in [[self scrollview] subviews]) {
            if ([shadowView isKindOfClass:[UIImageView class]]) {
                [shadowView setHidden:YES];
            }
        }
    }
}

@end