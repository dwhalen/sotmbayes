//
//  SMRAbout.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 1/1/14.
//  Copyright (c) 2014 Daniel Whalen. All rights reserved.
//

#import "SMRAbout.h"

@interface SMRAbout ()

@end

@implementation SMRAbout

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//- (void)viewWillAppear:(BOOL)animated {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"my" withExtension:@"html"];
//    [self.aboutWebView loadRequest:[NSURLRequest requestWithURL:url]];
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//}
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"my" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    if (htmlData) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle bundlePath];
        NSString *fullPath = [NSBundle pathForResource:@"my" ofType:@"html" inDirectory:path];
        [self.aboutWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:fullPath]]];
        self.aboutWebView.delegate = self;
    }
}

-(BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request
navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL* url = [request URL];
    if (navigationType == UIWebViewNavigationTypeFormSubmitted || navigationType ==     UIWebViewNavigationTypeFormSubmitted)
    {
        return ![[UIApplication sharedApplication] openURL:url];
    }
    return YES;
}


@end

