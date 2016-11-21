//
//  CSPClient.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPClient.h"

@implementation CSPClient

//This method takes the keyword and searches for the Country Code on 'we.postcoder.com'
+(void)searchCountryName: (NSString *)countryName
{
    NSLog(@"countryName entered in searchbar:%@", countryName);
    //use keyword from search bar to api search.
    NSString *searchString = [NSString stringWithFormat: @"http://ws.postcoder.com/pcw/PCW45-12345-12345-1234X/country?format=json"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: searchString parameters:nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //grab responseObject and find country code, pass that over to 'searchNewsWithKeywords' method--that will make the current events query for given country.
         
         NSLog(@"SUCCESSFUL Request");
         NSString *countryCode = [NSString new];
                  for (NSDictionary *country in responseObject)
                  {
                      if ([country[@"countryname"] isEqualToString: countryName])
                      {
                          countryCode = country[@"iso2"];
                          NSLog(@"We found the country search:%@ == %@", countryCode, countryName);
                          
                          [self searchNewsWithKeyword: countryCode withCompletion:^(NSArray *searchedContent)
                           {
                               
                             //call tableView here, update with content.
                          }];
                      }
                  }
         
         NSLog(@"could not find current events in %@", countryName);
         
     }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSLog(@"UNSUCCESSFUL Request");
         //include some awesome error handling here ^_^
         NSLog(@"Error fetching request. Error= \n%@", error.localizedDescription);
     }];
    
}

//this method is called whever a user searches for country news content. If no keyword is given: (A)default keyword is 'current events' for users location (B) tableview shows flags for potential contries (C) message given to type in desired country
+(void)searchNewsWithKeyword: (NSString *)countryCode withCompletion: (void (^)(NSArray *searchedContent))completion
{
    //use keyword from search bar to api search.
    NSArray *searchedContent = [NSArray new];
    NSString *searchString = [NSString stringWithFormat: @"http://www.google.com/search?q=currentEvents&gl=country%@",countryCode];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: searchString parameters:nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"SUCCESSFUL Request");
        NSLog(@"RESPONSE OBJECT:\n%@", responseObject);
        //grab responseObject and parse for content!
        //place in 'searched content' array.
        //this will be given to CSPViewController.
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
