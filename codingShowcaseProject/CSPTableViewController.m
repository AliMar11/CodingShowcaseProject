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
#import "CSPClient.h"

@interface CSPTableViewController ()
@property (nonatomic, strong) CSPVideo *video;
@property (nonatomic, strong) CSPVideo *selectedVideo;

@end

@implementation CSPTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.bounces = YES;
    [CSPClient youTubeSearch: self.keyword withCompletion:^(NSMutableArray *videoArray)
     {
         self.newsContent = videoArray;
         
//reload tableview after we have video content and every time we have new video content.
        [[NSOperationQueue mainQueue] addOperationWithBlock:^
         {
             [self.tableView reloadData];
         }];
     }];
}

//everytime this tableView appears, reset 'selectedVideo' so it can hold a new video object to pass along to next VC
-(void)viewDidAppear:(BOOL)animated
{
    [CSPVideo reset: self.selectedVideo];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//Here we config the cell depending on what the api looks like (the plan thusfar is to display the title and duration of each video object. If the api call comes back with an image for each video object, I would like to make that image the background for each cell with a transparent blur view on top
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"newsContentCell" forIndexPath: indexPath];
    
    //remove content from off-screen cells.
    [[[cell contentView] subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
   
    self.video = self.newsContent[indexPath.row];

    if (cell)
    {
        cell.textLabel.text = self.video.title;
        cell.detailTextLabel.text = self.video.videoDetails;
    }
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedVideo = self.newsContent[indexPath.row];
    
    [self performSegueWithIdentifier: @"videoVCSegue" sender: self];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CSPVideoViewController *videoVC = [segue destinationViewController];
    videoVC.chosenContent = self.selectedVideo;
}


@end
