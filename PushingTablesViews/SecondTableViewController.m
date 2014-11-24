//
//  SecontTableViewController.m
//  PushingTablesViews
//
//  Created by Matej Dolanc on 23/11/14.
//  Copyright (c) 2014 Matej Dolanc. All rights reserved.
//

#import "SecondTableViewController.h"

@implementation SecondTableViewController {
    NSArray *dogs;
    NSArray *cats;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    dogs = [NSArray arrayWithObjects:@"Dog1",@"Dog2",@"Dog3", nil];
    cats = [NSArray arrayWithObjects:@"Cat1",@"Cat2",@"Cat3", nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if([_animalName isEqualToString:@"Dogs"])
    {
        return [dogs count];
    }
    else if([_animalName isEqualToString:@"Cats"])
    {
        return [cats count];
    }
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier =@"Animal2Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if([_animalName isEqualToString:@"Dogs"])
    {
        cell.textLabel.text = [dogs objectAtIndex:indexPath.row];
    }
    else if([_animalName isEqualToString:@"Cats"])
    {
        cell.textLabel.text = [cats objectAtIndex:indexPath.row];
    }
    
    return cell;

}







@end
