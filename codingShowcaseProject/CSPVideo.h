//
//  CSPVideo.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPVideo : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *videoID;
@property (nonatomic, strong) NSString *videoDetails;

-(instancetype)initWithTitle: (NSString*)title
                 vidDetails: (NSString*)videoDetails
                     videoID: (NSString*)videoID;//etc.
//there is a thumbnail if ya want it... (under items/i/snippet/thumbnails)

//reset method for repeat use of 'CSPVideo *selected' content in CSPTableView class.
+(void)reset:(CSPVideo*)video;
@end
