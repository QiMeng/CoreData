//
//  News.m
//  CoreDataManager
//
//  Created by QiMENG on 14-12-9.
//  Copyright (c) 2014年 QiMENG. All rights reserved.
//

#import "News.h"


@implementation News

@dynamic descr;
@dynamic imgurl;
@dynamic islook;
@dynamic newsid;
@dynamic title;


+ (id)itemFormDic:(NSDictionary *)dic {
    
    News * model = [[News alloc]init];
    
    model.descr = dic[@"descr"];
    model.imgurl = dic[@"imgurl"];
    model.islook = dic[@"islook"];
    model.newsid = dic[@"newsid"];
    model.title = dic[@"title"];
    
    return model;
}


@end
