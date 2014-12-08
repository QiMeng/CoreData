//
//  AppDelegate.h
//  QMCoreData
//
//  Created by QiMENG on 14-11-7.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
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

@end
