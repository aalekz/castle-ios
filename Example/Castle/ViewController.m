//
//  CASViewController.m
//  Castle
//
//  Copyright (c) 2017 Castle. All rights reserved.
//

#import "ViewController.h"

#import <Castle/Castle.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)track:(id)sender {
    [Castle track:@"Button pressed"];
}

- (IBAction)screen:(id)sender {
    [Castle screen:@"Main Screen"];
}

- (IBAction)identify:(id)sender {
    // Identify user with unique identifier including user traits
    [Castle identify:@"1245-3055" traits:@{ @"email": @"laura@example.com" }];
}

- (IBAction)testInterceptor:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"https://google.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // Get required headers from the Castle SDK if you don't want to use the request interceptor
    [Castle.headers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull value, BOOL * _Nonnull stop) {
        [request addValue:value forHTTPHeaderField:key];
    }];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response: %@, Error: %@", response, error);
    }] resume];
}

- (IBAction)flush:(id)sender {
    [Castle flush];
}

- (IBAction)reset:(id)sender {
    [Castle reset];
}

@end
