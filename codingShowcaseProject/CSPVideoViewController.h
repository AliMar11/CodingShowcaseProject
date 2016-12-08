//
//  CSPVideoViewController.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/20/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import "CSPVideo.h"

@interface CSPVideoViewController : UIViewController

@property (nonatomic, strong) CSPVideo *chosenContent;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(void)playvideo:(CSPVideo*)chosenContent;

@end
