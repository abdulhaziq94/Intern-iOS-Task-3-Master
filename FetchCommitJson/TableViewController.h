//
//  TableViewController.h
//  FetchCommitJson
//
//  Created by Abdul Haziq on 27/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#define JSON_URL @"https://api.github.com/repos/spring-projects/spring-boot"
#import <UIKit/UIKit.h>
#import "CommitCell.h"
#import "CommitObject.h"
#import "SpringBoot.h"

@interface TableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray * objectHolderArray;


@end
