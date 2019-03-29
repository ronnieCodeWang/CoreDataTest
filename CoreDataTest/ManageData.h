//
//  ManageData.h
//  CoreDataTest
//
//  Created by Sunell on 2018/10/26.
//  Copyright © 2018 Sunell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ManageData : NSObject
+(instancetype) shareInstance;
-(void)insertData;
-(void)selectAtion;
@end

NS_ASSUME_NONNULL_END
