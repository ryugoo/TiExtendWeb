#import "TiUIWebView+Extend.h"
#import "TiUtils.h"

@implementation TiUIWebView (TiUIWebView_Extend)

- (void)setNormalScrollSpeed_:(id)args
{
    BOOL normalSpeed = [TiUtils boolValue:args def:NO];
    UIScrollView *scrollView = [self performSelector:@selector(scrollview)];
    if (normalSpeed == YES) {
        [scrollView setDecelerationRate:UIScrollViewDecelerationRateNormal];
    } else {
        [scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    }
}

- (void)setRemoveShadow_:(id)args
{
    BOOL removeFlag = [TiUtils boolValue:args def:NO];
    UIScrollView *scrollView = [self performSelector:@selector(scrollview)];
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
    UIScrollView *scrollView = [self performSelector:@selector(scrollview)];
    if (removeFlag == YES)
    {
        [scrollView setDelaysContentTouches:NO];
    }
}

- (void)setUserAgentForiOS_:(id)args
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent": args}];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *requestURL = [request URL];
    NSString *scheme = [[requestURL scheme] lowercaseString];
    NSString *path = [requestURL path];
    if([path hasPrefix:@"/"]) {
        path = [path substringWithRange:NSMakeRange(1, path.length - 1)];
    }
    if ([scheme isEqualToString:@"extendwebview"]) {
        NSString *eventName = [requestURL host];
        if ([self.proxy _hasListeners:eventName]){
            NSLog(@"[DEBUG] fire: %@",eventName);
            [self.proxy fireEvent:eventName
                       withObject:@{@"path": path,
                                    @"event": eventName}];
        }
        return NO;
    }
    return YES;
}

@end