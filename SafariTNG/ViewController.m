//
//  ViewController.m
//  SafariTNG
//
//  Created by roshan on 01/10/2014.
//  Copyright (c) 2014 learningIOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate , UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        [self loadHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.delegate = self;
    alertView.title = @"Bad Error";
    alertView.message = error.localizedDescription;

    [alertView addButtonWithTitle:@"Clear"];
    [alertView addButtonWithTitle:@"Go Home Page"];

    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{

    if(buttonIndex == 1)
    {

        [self loadHomePage];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self loadURLString:textField.text];
    return YES;
}

-(void) loadURLString:(NSString*) urlString{


    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];

    [self.webView loadRequest:urlRequest];

}

-(void) loadHomePage{

    [self loadURLString:@"http://www.mobilemakers.co"];
}

@end
