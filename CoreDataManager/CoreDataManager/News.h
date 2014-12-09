//
//  News.h
//  CoreDataManager
//
//  Created by QiMENG on 14-12-9.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface News : NSManagedObject

@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) NSString * imgurl;
@property (nonatomic, retain) NSString * islook;
@property (nonatomic, retain) NSString * newsid;
@property (nonatomic, retain) NSString * title;

+ (id)itemFormDic:(NSDictionary *)dic;


@end

