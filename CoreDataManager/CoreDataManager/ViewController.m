//
//  ViewController.m
//  CoreDataManager
//
//  Created by QiMENG on 14-12-9.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"
#import "News.h"
@interface ViewController () {
    
    CoreDataManager * coreManager;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    coreManager = [[CoreDataManager alloc]init];

    
//    News * model = [];
    
//    News* model=(News *)[NSEntityDescription insertNewObjectForEntityForName:@"News" inManagedObjectContext:coreManager.managedObjectContext];
//    model.title = @"title";
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (int i = 0; i < 100 ; i++) {
        [array addObject:@{@"title": [NSString stringWithFormat:@"%d",i]}];
    }
    
    [coreManager insertCoreData:array];
    
    
    NSMutableArray * temps =  [coreManager selectData:10 andOffset:0];
    
    NSLog(@"%@",temps);
    
    NSLog(@"%@",[coreManager applicationDocumentsDirectory]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
