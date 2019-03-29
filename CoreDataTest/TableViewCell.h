//
//  TableViewCell.h
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;

-(void)setData:(NSDictionary *)model;

@end

NS_ASSUME_NONNULL_END
