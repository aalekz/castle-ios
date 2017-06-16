//
//  CastleConfiguration.m
//  Castle
//
//  Copyright © 2017 Castle. All rights reserved.
//

#import "CastleConfiguration.h"

@interface CastleConfiguration ()
@property (nonatomic, copy, readwrite) NSString *publishableKey;
@end

@implementation CastleConfiguration

+ (instancetype _Nonnull)configurationWithPublishableKey:(NSString * _Nonnull)publishableKey
{
    NSAssert([publishableKey hasPrefix:@"pk_"], @"You must provide a valid Castle publishable key when initializing the SDK.");

    CastleConfiguration *configuration = [[CastleConfiguration alloc] init];
    configuration.publishableKey = publishableKey;
    configuration.screenTrackingEnabled = YES;
    configuration.debugLoggingEnabled = NO;
    configuration.flushLimit = 20;
    configuration.maxQueueLimit = 1000;
    return configuration;
}

#pragma mark - Setters

- (void)setBaseURLWhiteList:(NSArray *)baseURLWhiteList
{
    NSMutableArray *whitelist = @[].mutableCopy;
    for (NSURL *url in baseURLWhiteList) {
        if([url isKindOfClass:NSURL.class]) {
            // Only add the base URL discarding any other components of the provided URL
            [whitelist addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@/", url.scheme, url.host]]];
        }
    }
    _baseURLWhiteList = whitelist.copy;
}

@end
