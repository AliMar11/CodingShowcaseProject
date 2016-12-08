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

    //below will hold video objects
    NSMutableArray *videoArray = [NSMutableArray new];
    
    NSString *searchterm = [keyword stringByReplacingOccurrencesOfString: @" "
                                                              withString: @"+"];
//    //placeholder for api search. 
    NSString *youTubeString = [NSString stringWithFormat: @"https://www.youtube.com/results?&part=snippet&q=%@+current+events", searchterm];
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
                
                NSLog(@"\n\nthe thiiiiiing:\n%@\n\n\n\n", jsonResponse);
                
                //the below dictionary will capture a copy of responseObject
                NSMutableArray *contentArray = [[NSMutableArray alloc] initWithArray: [jsonResponse[@"items"] mutableCopy]];
                
               // for(NSArray *videoQuery in contentArray)
                for (int i = 0;  i < contentArray.count; i++)
                {
                CSPVideo *video = [[CSPVideo alloc] initWithTitle: contentArray[i][@"snippet"][@"title"]
                                                       vidDetails: contentArray[i][@"snippet"][@"description"]
                                                          videoID: contentArray[i][@"id"][@"videoId"]];
                
                    NSLog(@"\n\nVIDEO??????:%@", video);
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
