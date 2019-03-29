//
//  ManageData.m
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import "ManageData.h"
#import <CoreData/CoreData.h>
#import "Student+CoreDataClass.h"



@implementation ManageData
{
    NSManagedObjectContext *_context;
}
static ManageData* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init] ;
    }) ;
    
    return _instance ;
}

-(instancetype)init{
    if (self == [super init]) {
        
//        [self createDB];
        return self;
    }
    return  nil;
}

-(void)insertData{
    Student * student = [NSEntityDescription  insertNewObjectForEntityForName:@"Student"  inManagedObjectContext:_context];
    
    //2.根据表Student中的键值，给NSManagedObject对象赋值
    student.title = @"鹏哥";
    student.age = 300;
    student.sex = @"男";

    
    //   3.保存插入的数据
    NSError *error = nil;
    if ([_context save:&error]) {
        NSLog(@"数据插入到数据库成功");
    
    }else{
         NSLog(@"数据插入到数据库失败");
    }
}

///查
-(void)selectAtion
{
    ///先读取这个类 这里有点像字典里面根据 key 查找 value 的意思
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student"
                                              inManagedObjectContext:_context];
    ///创建查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    ///设置查询请求的 实体
    [request setEntity:entity];
    
    ///这是查询条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age=30"];
    [request setPredicate:predicate];
    
    ///获取查询的结果
    NSArray *resultArray = [_context executeFetchRequest:request
                                                                                      error:nil];
    ///打印查询结果
    for (Student *stu in resultArray) {
        NSLog(@"查询到一个学生 名字是:%@  年龄是:%d 性别：%@",stu.title,stu.age,stu.sex);
    }
    
}

-(void)createDB{
    //1、创建模型对象
    //获取模型路径
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    //根据模型文件创建模型对象
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    //2、创建持久化存储助理：数据库
    //利用模型对象创建助理对象
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    //数据库的名称和路径
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlPath = [docStr stringByAppendingPathComponent:@"coreData.sqlite"];
    NSLog(@"数据库 path = %@", sqlPath);
    NSFileManager *fileManage = [NSFileManager defaultManager];
    BOOL exist= [fileManage fileExistsAtPath:sqlPath];
    
    NSURL *sqlUrl = [NSURL fileURLWithPath:sqlPath];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                             nil];

    
    if (!exist) {
        NSError *error = nil;
        //设置数据库相关信息 添加一个持久化存储库并设置类型和路径，NSSQLiteStoreType：SQLite作为存储库
        [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:options error:&error];
        
        if (error) {
            NSLog(@"添加数据库失败:%@",error);
        } else {
            NSLog(@"添加数据库成功");
        }
    }
    else{
        NSLog(@"数据库已存在");
    }
    
    
    //3、创建上下文 保存信息 对数据库进行操作
    if (_context == nil) {
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        //关联持久化助理
        _context.persistentStoreCoordinator = store;
    }
    
}

@end
