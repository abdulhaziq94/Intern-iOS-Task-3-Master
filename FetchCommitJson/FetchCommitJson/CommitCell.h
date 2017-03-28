//
//  CommitCell.h
//  FetchCommitJson
//
//  Created by Abdul Haziq on 27/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UITextView *CommitMessageTV;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *EmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UILabel *CommitNoLabel;



@end
