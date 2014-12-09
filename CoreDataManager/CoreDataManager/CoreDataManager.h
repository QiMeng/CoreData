//
//  CoreDataManager.h
//  CoreDataManager
//
//  Created by QiMENG on 14-12-9.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TableName @"News" 

@interface CoreDataManager : NSObject

/**
 *  管理对象，上下文，持久性存储模型对象
 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/**
 *  被管理的数据模型，数据结构
 */
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

/**
 *  连接数据库
 */
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


/**
 *  保存数据到持久层（数据库）
 */
- (void)saveContext;

/**
 *  应用程序沙箱下的Documents目录路径
 *
 *  @return 目录路径
 */
- (NSURL *)applicationDocumentsDirectory;


//插入数据
- (void)insertCoreData:(NSMutableArray*)dataArray;
//查询
- (NSMutableArray*)selectData:(int)pageSize andOffset:(int)currentPage;
//删除
- (void)deleteData;
//更新
- (void)updateData:(NSString*)newsId withIsLook:(NSString*)islook;



@end
