//
//  Student+CoreDataProperties.m
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic age;
@dynamic title;
@dynamic sex;

@end
