//
//  CSPVideo.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPVideo.h"

@implementation CSPVideo : NSObject

-(instancetype) initWithTitle:(NSString *)title vidDetails:(NSString *)videoDetails videoID:(NSString *)videoID
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _videoDetails = videoDetails;
        _videoID = videoID;
        
        //_duration = duration;
        //etc.
    }
    return self;
}

+(void)reset:(CSPVideo*)video
{
    video = [[CSPVideo alloc] init];
}


@end
