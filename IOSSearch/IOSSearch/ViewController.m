//
//  ViewController.m
//  IOSSearch
//
//  Created by Jimmy Huynh on 6/2/20.
//  Copyright © 2020 Jimmy Huynh. All rights reserved.
//

#import "ViewController.h"
#import <NCMB/NCMB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)SearchIN:(id)sender {
    NCMBQuery *query = [NCMBQuery queryWithClassName:@"SearchClass"];
    [query whereKey:@"name" containedIn:@[@"name5", @"name2"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error);
        } else {
            NSLog(@"Data %@", objects);
        }
    }];
}
- (IBAction)SearchInArray:(id)sender {
    NCMBQuery *query = [NCMBQuery queryWithClassName:@"SearchClass"];
    [query whereKey:@"name" containedInArrayTo:@[@"name5", @"name2"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error);
        } else {
            NSLog(@"Data %@", objects);
        }
    }];
}


@end
