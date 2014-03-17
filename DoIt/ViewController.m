//
//  ViewController.m
//  DoIt
//
//  Created by Manas Pradhan on 3/17/14.
//  Copyright (c) 2014 Manas Pradhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray* items;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    items = @[@"One", @"Two", @"Three"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %i", indexPath.row];
    cell.textLabel.text = items[indexPath.row];
    return cell;
}

@end
