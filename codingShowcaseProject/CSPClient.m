//
//  CSPClient.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPClient.h"

@implementation CSPClient



//this method is ran whever a user searches for country news content. If no keyword is given: (A)default keyword is 'current events' for users location (B) tableview shows flags for potential contries
+(void)searchNewsWithKeyword: (NSString *)keyword withCompletion: (void (^)(NSArray *searchedContent))completion
{
    //use keyword from search bar to api search.
    NSArray *searchedContent = [NSArray new];
    NSString *searchString = [NSString stringWithFormat: @"http://country.io/names.json"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: searchString parameters:nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"SUCCESSFUL Request");
        NSLog(@"RESPONSE OBJECT:\n%@", responseObject);
        //grab responseObject and parse for content!
        //place in 'searched content' array.
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"UNSUCCESSFUL Request");
        //include some awesome error handling here ^_^
        NSLog(@"Error fetching request. Error= \n%@", error.localizedDescription);
    }];

    completion(searchedContent);
}


@end
