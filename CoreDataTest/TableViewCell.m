//
//  TableViewCell.m
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setData:(NSDictionary *)model{
    _name.text = model[@"name"];
    _age.text = model[@"age"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
