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
#import "CSPVideo.h"

@interface CSPClient : NSObject

+(void)youTubeSearch: (NSString*)keyword withCompletion: (void(^)(NSMutableArray *videoArray))completion;

@end
