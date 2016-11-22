//
//  CSPVideoViewController.h
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/20/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

@interface CSPVideoViewController : UIViewController

@property (nonatomic, strong) NSURL *chosenContent;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(void)playvideo:(NSURL*)chosenContent;

@end
