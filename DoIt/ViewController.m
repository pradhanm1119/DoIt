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
    NSString* one;
    NSString* two;
    NSString* three;
    NSMutableArray* items;
    //BOOL buttonPressed;
    IBOutlet UITextField *myTextField;
    IBOutlet UIButton *myButton;
    UIColor* green;
    IBOutlet UIButton *myEditButton;
    BOOL isEditModeEnabled;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    items = [[NSMutableArray alloc] init];
    
    one   = @"One";
    two   = @"Two";
    three = @"Three";
    [items addObject:one];
    [items addObject:two];
    [items addObject:three];
    green = [UIColor greenColor];
    //buttonPressed = NO;
    isEditModeEnabled = NO;
    
}
- (IBAction)onEditButtonPressed:(UIButton*)sender
{
//    UIButton* changeButton = editButton;
//    [changeButton setTitle:@"Done" forState:UIControlStateSelected];
    UIButton *btn = (UIButton *)sender;
    [btn setTitle:@"Done" forState:UIControlStateNormal];
    isEditModeEnabled = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSInteger newCount;
//    if (buttonPressed == YES) {
//        newCount = [items count];
//        buttonPressed = NO;
//        return newCount;
//    }
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

- (IBAction)onAddButtonPressed:(id)myButton
{
    NSString* text;
    text = myTextField.text;
    [items addObject:text];
    [myTableView reloadData];
    myTextField.text = nil;
    //[items insertObject:text inTheArrayAtIndex:[[items count]]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%@", indexPath);
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = green;
    
    if (isEditModeEnabled == YES)
    {
        [items removeObjectAtIndex:indexPath.row];
        [myTableView reloadData];
        isEditModeEnabled = NO;
        [myEditButton setTitle:@"Edit" forState:UIControlStateNormal];
    }
}

//-(UITableView *)tableView:(UITableView *)tableView removeFromRowAtIndexPath:(NSIndexPath *) indexPath
//{
//    [tableView cellForRowAtIndexPath:indexPath];
//    if (isEditModeEnabled == YES)
//    {
//        [items removeObjectAtIndex:indexPath.row];
//        [myTableView reloadData];
//        isEditModeEnabled = NO;
//    }
//}

@end
