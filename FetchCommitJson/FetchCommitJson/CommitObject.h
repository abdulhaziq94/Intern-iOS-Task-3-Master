//
//  CommitObject.h
//  FetchCommitJson
//
//  Created by Abdul Haziq on 27/03/2017.
//  Copyright © 2017 Abdul Haziq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommitObject : NSObject

@property (nonatomic,strong) NSString *CommitMessage;
@property (nonatomic,strong) NSString *Name;
@property (nonatomic,strong) NSString *Email;
@property (nonatomic,strong) NSString *Date;
@property (nonatomic,strong) NSString *CommitCount;
@property (nonatomic,strong) NSString *CommitNo;

//-(instancetype) CommitMessage: (NSString *)comitterMessage Name: (NSString *)committerName Email: (NSString *)committerEmail Date: (NSString *)committerDate;

@end
