//
//  CPSViewController.m
//  codingShowcaseProject
//
//  Created by Alicia Marisal on 11/19/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "CSPViewController.h"
#import "CSPClient.h"

@interface CSPViewController () <UISearchBarDelegate>
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

//create TableView OR collectionView... ^_^
-(void)searchButtonTapped
{
    NSLog(@"search bar tapped");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
