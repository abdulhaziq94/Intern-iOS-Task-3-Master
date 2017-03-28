//
//  TableViewController.m
//  FetchCommitJson
//
//  Created by Abdul Haziq on 27/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (NSMutableArray *)objectHolderArray{
    if (!_objectHolderArray) _objectHolderArray = [[NSMutableArray alloc]init];
    return _objectHolderArray;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *commitURL = [NSURL URLWithString:JSON_URL];
    NSData *jsonData = [NSData dataWithContentsOfURL:commitURL];
    NSError *error = nil;
    id SpringBootJson = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    SpringBoot *SBOject = [[SpringBoot alloc] init];
    SBOject.commit_url = [SpringBootJson objectForKey:@"commits_url"];
    NSString *new_string = [SBOject.commit_url stringByReplacingOccurrencesOfString:@"{/sha}" withString:@""];
    NSData *new_data = [NSData dataWithContentsOfURL:[NSURL URLWithString:new_string]];
    id CommitJson = [NSJSONSerialization JSONObjectWithData:new_data options:kNilOptions error:&error];
    

    
    for (NSDictionary *CommitDictionary in CommitJson) {
        CommitObject *committer = [[CommitObject alloc] init];
        committer.CommitMessage = [CommitDictionary valueForKeyPath:@"commit.message"];
        committer.Name =[CommitDictionary valueForKeyPath:@"commit.committer.name"];
        committer.Email = [CommitDictionary valueForKeyPath:@"commit.committer.email"];
        committer.Date = [CommitDictionary valueForKeyPath:@"commit.committer.date"];
        
        [self.objectHolderArray addObject:committer];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.objectHolderArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    CommitCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    

    for (long i = 0; i <[self.objectHolderArray count]; i++) {
   
    long i = indexPath.row;
    CommitObject *committer = [self.objectHolderArray objectAtIndex:i];
    cell.CommitMessageTV.text = committer.CommitMessage;
    cell.NameLabel.text = committer.Name;
    cell.EmailLabel.text = committer.Email;
    cell.DateLabel.text = committer.Date;
    
    NSString *totalCommit = [NSString stringWithFormat:@"Total Commit: %lu", (unsigned long)[self.objectHolderArray count]];
    committer.CommitCount = totalCommit;
    cell.testLabel.text = committer.CommitCount;
        
    NSString *commitNo = [NSString stringWithFormat:@"Commit No: %lu", indexPath.row+1];
    committer.CommitNo = commitNo;
    cell.CommitNoLabel.text = committer.CommitNo;
    }


    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
