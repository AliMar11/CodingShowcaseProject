//
//  CSPClient.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPClient.h"
@implementation CSPClient

//this method is called whever a user searches for country news content. (A) tableview shows flags for potential contries (B) message given to type in desired country

+(void)youTubeSearch: (NSString*)keyword withCompletion: (void(^)(NSMutableArray *videoArray))completion

{
    NSString *searchterm = [keyword stringByReplacingOccurrencesOfString: @" "
                                                              withString: @"+"];
//    //placeholder for api search. 
    NSString *youTubeString = [NSString stringWithFormat: @"https://www.youtube.com/results?&part=snippet&q=%@+current+events", searchterm];


    //the below array will capture the responseObject array we need
    NSMutableArray *contentArray = [NSMutableArray new];
    
    //below will hold video objects
    NSMutableArray *videoArray = [NSMutableArray new];
    AFHTTPSessionManager *youTubeManager = [AFHTTPSessionManager manager];
    [youTubeManager GET: youTubeString parameters: nil progress: nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"SUCCESSFUL YOUTUBE Request!");
        NSLog(@"\n\nRESPOSNSE OBJD:\n%@", responseObject);
        
        //below we create dictionary snippets of the data we want on eacg video
        for (NSDictionary *contentDictionary in contentArray)
        {
            CSPVideo *video = [[CSPVideo alloc] initWithTitle: contentDictionary[@"titleValue"]
                                                     duration: contentDictionary [@"durationValue"]];
            //what will actually happen
           // [videoArray addObject: video];
            
            //test
            [videoArray addObjectsFromArray:[@[@"https://www.youtube.com/watch?v=7jYa7dfrXKU"]mutableCopy]];
        }
        
        [videoArray addObjectsFromArray:[@[@"https://www.youtube.com/watch?v=7jYa7dfrXKU"]mutableCopy]];
        completion(videoArray);
    }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                NSLog(@"UNSUCCESSFUL YOUTUBE Request");
                //include some awesome error handling here ^_^
                NSLog(@"Error fetching request. Error= \n%@", error.localizedDescription);
                completion([@[] mutableCopy]);
            }];
}


@end
