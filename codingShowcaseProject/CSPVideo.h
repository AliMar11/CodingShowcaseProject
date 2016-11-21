//
//  CSPVideo.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPVideo : NSObject
//here we define everything that is video object
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *duration;
//@property (nonatomic, strong) NSString *
//@property (nonatomic, strong) NSString *
//@property (nonatomic, strong) NSString *

-(instancetype)initWithTitle: (NSString*)title
                    duration:(NSString*)duration; //etc.
@end
