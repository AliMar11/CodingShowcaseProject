//
//  CSPVideo.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/21/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPVideo.h"

@implementation CSPVideo
-(instancetype) initWithTitle:(NSString *)title
                     duration:(NSString *)duration
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _duration = duration;
        //etc.
    }
    return self;
}

@end
