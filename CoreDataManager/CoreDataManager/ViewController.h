//
//  ViewController.h
//  CoreDataManager
//
//  Created by QiMENG on 14-12-9.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate> {
    
    
    __weak IBOutlet UITableView *myTableView;
    
    int pageInt;
    
    int maxCount;
    
    int fetchInt;
    
}

@property (nonatomic,strong) NSMutableArray * dataArray;


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
