//
//  CSPTableViewController.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/20/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPTableViewController.h"
#import "CSPVideoViewController.h"
#import "CSPVideo.h"

@interface CSPTableViewController ()

@end

@implementation CSPTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.newsContent = [@[@"hack", @"night", @"fun"]mutableCopy];
    return self.newsContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //here we config the cell depending on what the api looks like (my plan thusfar is to display the title and duration of each video object. If the api call comes back with an image for each video object, I would like to make that image the background for each cell with a transparent blur view on top--- I find this gives a very professional yet eye-catching look and feel to an app^_^)
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"newsContentCell" forIndexPath: indexPath];
    
    //remove content from off-screen cells.
    [[[cell contentView] subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    CSPVideo *video = self.newsContent[indexPath.row];
   /*
         if (video.VIDEOVALUE)
        {
    
            dispatch_async(dispatch_get_main_queue(),
                   ^{
                       //setup thevid for each cell with video and video title.
                       cell.textLabel.text = video.title;
                       cell.detailTextLabel.text = video.duration;

                   });
        };
    */
    return cell;
}

#pragma mark - Navigation

//here we will send the url with video.row to the video player VC
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndex = self.tableView.indexPathForSelectedRow;
    CSPVideoViewController *videoVC = [segue destinationViewController];
    NSURL *videoURL = [NSURL URLWithString: @"place real url here..."];
    videoVC.chosenContent = videoURL;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
