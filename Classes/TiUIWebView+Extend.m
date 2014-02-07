//
//  TiUIWebView+Extend.m
//  TiExtendWeb
//
//  Created by ryugoo on 2013/05/18.
//
//

#import "TiUIWebView+Extend.h"
#import "TiUIWebViewProxy.h"
#import "TiUtils.h"

@implementation TiUIWebView (TiUIWebView_Extend)

- (void)setNormalScrollSpeed_:(id)args
{
    BOOL normalSpeed = [TiUtils boolValue:args def:NO];
    UIScrollView *scrollView = [self performSelector:@selector(scrollview) withObject:nil];
    if (normalSpeed == YES) {
        // Same TableView, ScrollView scroll speed.
        [scrollView setDecelerationRate:UIScrollViewDecelerationRateNormal];
    } else {
        // Default scroll speed.
        [scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    }
}

- (void)setRemoveShadow_:(id)args
{
    BOOL removeFlag = [TiUtils boolValue:args def:NO];
    UIScrollView *scrollView = [self performSelector:@selector(scrollview) withObject:nil];
    if (removeFlag == YES)
    {
        for (UIView *shadowView in [scrollView subviews]) {
            if ([shadowView isKindOfClass:[UIImageView class]]) {
                [shadowView setHidden:YES];
            }
        }
    }
}

- (void)setRemoveScrollDelay_:(id)args
{
    BOOL removeFlag = [TiUtils boolValue:args def:NO];
    UIScrollView *scrollView = [self performSelector:@selector(scrollview) withObject:nil];
    if (removeFlag == YES)
    {
        [scrollView setDelaysContentTouches:NO];
    }
}

- (void)setUserAgentForiOS_:(id)args
{
    NSDictionary *dict = @{@"UserAgent": args};
    [[NSUserDefaults standardUserDefaults] registerDefaults:dict];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // Get request URL
    NSURL *requestURL = [request URL];
    // Get scheme information
    NSString *scheme = [[requestURL scheme] lowercaseString];
    // Get URL path information
    NSString *path = [requestURL path];
    // If the path begins with "/"
    if([path hasPrefix:@"/"]) {
        // Remove the head of the "/"
        path = [path substringWithRange:NSMakeRange(1, path.length - 1)];
    }
    // If the scheme begins with "extendwebview"
    if ([scheme isEqualToString:@"extendwebview"]) {
        // Get event name from host
        NSString *eventName = [requestURL host];
        // The same as the event name if it has been registered in the event listener
        if ([self.proxy _hasListeners:eventName]){
            NSLog(@"[DEBUG] fire: %@",eventName);
            // Get event information
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:path, @"path", eventName, @"event", nil];
            // Execute
            [self.proxy fireEvent:eventName withObject:event];
        }
        return NO;
    }
    return YES;
}

@end