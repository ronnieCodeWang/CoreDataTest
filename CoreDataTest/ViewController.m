//
//  ViewController.m
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ManageData.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *tableView;
    ManageData *manageData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self InitTab];
    manageData = [ManageData shareInstance];
    [manageData insertData];
    [manageData selectAtion];
    
}

- (void)InitTab{
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
}

- (NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
        NSDictionary *dict1 = @{@"name":@"aaa",@"age":@"12"};
        NSDictionary *dict2 = @{@"name":@"ccc",@"age":@"23"};
        NSDictionary *dict3 = @{@"name":@"bbb",@"age":@"34"};
        NSDictionary *dict4 = @{@"name":@"ddd",@"age":@"31"};
        NSDictionary *dict5 = @{@"name":@"eee",@"age":@"18"};
        [_data addObject:dict1];
        [_data addObject:dict2];
        [_data addObject:dict3];
        [_data addObject:dict4];
        [_data addObject:dict5];
    }
    return _data;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    NSDictionary *model = self.data[indexPath.row];
    [cell setData:model];
    return cell;
    
}


@end
