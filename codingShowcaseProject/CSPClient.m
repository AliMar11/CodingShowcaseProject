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
    NSMutableArray *videoArray = [NSMutableArray new];
    
    NSString *searchterm = [keyword stringByReplacingOccurrencesOfString: @" "
                                                              withString: @"+"];

    NSString *youTubeAPI = [NSString stringWithFormat: @"https://www.googleapis.com/youtube/v3/search?key=AIzaSyBt9qg2jqdSrdrcdXeF5BMUfr8IxC2MoD8&part=snippet&q=%@+current+events", searchterm];
    

    NSURL *url = [[NSURL alloc]initWithString: youTubeAPI];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];
    
    //asynchronous ULR request
    [[[NSURLSession sharedSession] dataTaskWithRequest: urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSError *jsonError;

        if (!error && data)
        {
            NSLog(@"SUCCESSFUL REQUEST");
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:&jsonError];
            
            if (!jsonError)
            {
                NSLog(@"SUCCESSFUL JSON SERIALIZAITON");
                
                NSMutableArray *contentArray = [[NSMutableArray alloc] initWithArray: [jsonResponse[@"items"] mutableCopy]];
                
                for(NSDictionary *videoQuery in contentArray)
                {
                CSPVideo *video = [[CSPVideo alloc] initWithTitle: videoQuery[@"snippet"][@"title"]
                                                       vidDetails: videoQuery[@"snippet"][@"description"]
                                                          videoID: videoQuery[@"id"][@"videoId"]];
                
                    [videoArray addObject: video];
                }
                completion(videoArray);

            }
            else
            {
                NSLog(@"JSON ERROR:%@", jsonError);
            }
            
        }
    
    }] resume];
    
}


@end
