//
//  CPSClient.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface CPSClient : NSObject

+ (void)searchNewsWithKeyword: (NSString *)keyword withCompletion: (void (^)(NSArray *searchedContent))completion;

@end
