//
//  CSPClient.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CSPViewController.h"

@interface CSPClient : NSObject

+(void)searchCountryName: (NSString *)countryName;
+(void)searchNewsWithKeyword: (NSString *)countryCode withCompletion: (void (^)(NSArray *searchedContent))completion;

@end
