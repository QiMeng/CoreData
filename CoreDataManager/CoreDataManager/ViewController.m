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

#import "MJRefresh.h"

@interface ViewController () {
    
    CoreDataManager * coreManager;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    maxCount = 20;
    fetchInt = 26;
    
    _dataArray = [NSMutableArray array];
    pageInt = 0;
    
    coreManager = [[CoreDataManager alloc]init];
    
    NSLog(@"%@",[coreManager applicationDocumentsDirectory]);
    
//    NSMutableArray * array = [NSMutableArray array];
//    for (int i = 0; i < maxCount ; i++) {
//        [array addObject:@{@"title": [NSNumber numberWithInt:i]}];
//    }
//    [coreManager insertCoreData:array];
    
    [self setupRefresh];
    
    [myTableView headerBeginRefreshing];
    
    
}

#pragma mark - 集成刷新控件
- (void)setupRefresh
{
    [myTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    myTableView.headerPullToRefreshText = @"继续下拉刷新";
    myTableView.headerReleaseToRefreshText = @"松手开始刷新";
    myTableView.headerRefreshingText = @"正在刷新";
}

- (void)headerRereshing {
    
    
    if (_dataArray.count) {
        News * model = [_dataArray firstObject];
        fetchInt = [model.title intValue];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableArray * temps =  [coreManager selectData:4 andOffset:pageInt low:fetchInt];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0,[temps count])];
            [_dataArray insertObjects:temps atIndexes:indexes];
            [myTableView reloadData];
            [myTableView headerEndRefreshing];
            
        });
    });
    
}

- (IBAction)touchAdd:(id)sender {
    
    
    NSManagedObjectContext *context = [coreManager managedObjectContext];
    
    News *newsInfo = [NSEntityDescription insertNewObjectForEntityForName:TableName inManagedObjectContext:context];
    
    newsInfo.title = @27;
    
    NSError *error;
    if(![context save:&error])
    {
        NSLog(@"不能保存：%@",[error localizedDescription]);
    }
//
//    [_dataArray addObject:newsInfo];
//    
//    [myTableView reloadData];
    
    
}

//- (NSFetchedResultsController *)fetchedResultsController {
//    if (_fetchedResultsController != nil) {
//        return _fetchedResultsController;
//    }
//    
//    NSFetchedResultsController *controller = [[NSFetchedResultsController alloc] initWithFetchRequest:request
//                                                                                 managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil
//                                                                                            cacheName:nil];
//    
//    
//    self.fetchedResultsController = [coreManager contactFetchedResultsController];
//    self.fetchedResultsController.delegate = self;
//    return _fetchedResultsController;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    News * model = _dataArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",[model.title intValue]];
    
    return cell;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
