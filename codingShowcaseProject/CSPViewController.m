//
//  CPSViewController.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPViewController.h"
#import "CSPClient.h"
#import "CSPTableViewController.h"

@interface CSPViewController () <UISearchBarDelegate>
@property (nonatomic, strong) NSMutableArray *videoList;
@end

@implementation CSPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createSearchBar];
    NSLog(@"CREated search bar");
}

-(void)createSearchBar
{
    self.searchBar = [UISearchBar new];
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Enter desired Country";
    self.searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.searchBar.showsSearchResultsButton = YES;

    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc]initWithTitle: @"search" style: UIBarButtonItemStylePlain target: self action: @selector(searchButtonTapped)];
    
    [searchBarItem setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIFont fontWithName: @"Helvetica-Bold" size: 15], NSFontAttributeName,
                                            [UIColor blackColor], NSForegroundColorAttributeName, nil]
                                 forState: UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = searchBarItem;
}

-(void)searchButtonTapped
{
    NSLog(@"search bar tapped");
    NSString *countryName = [NSString new];
    countryName = self.searchBar.text;
    [CSPClient youTubeSearch: self.searchBar.text withCompletion:^(NSMutableArray *videoArray) {
        //below is what we will actually do:
       // [self.videoList addObjectsFromArray: videoArray];
        
        //testing data for videoplayer:
//        [self.videoList addObject: videoArray];
        
        [self performSegueWithIdentifier: @"tableViewSegue" sender: self];
        [self.videoList addObject: videoArray];

        }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString: @"tableViewSegue"])
    {
        CSPTableViewController *tableVC = segue.destinationViewController;
        tableVC.newsContent = self.videoList;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
