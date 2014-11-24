//
//  RootViewController.m
//  PushingTablesViews
//
//  Created by Matej Dolanc on 23/11/14.
//  Copyright (c) 2014 Matej Dolanc. All rights reserved.
//

#import "RootViewController.h"
#import "SecondTableViewController.h"



@implementation RootViewController {
    NSArray *animals;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    animals = [NSArray arrayWithObjects: @"Dogs",@"Cats", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [animals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *simpleTableIdentifier =@"AnimalCell";
    
    NSLog(@"cellForRowAtIndexPath");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text=[animals objectAtIndex:indexPath.row];
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue");
    
    if([segue.identifier isEqualToString:@"showArrayDetail"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        SecondTableViewController *destinationViewController = segue.destinationViewController;
        destinationViewController.animalName = [animals objectAtIndex:indexPath.row];
        destinationViewController.title = destinationViewController.animalName;
        
    }
}

@end
