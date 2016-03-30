//
//  LQQNameSortTool.m
//  名称排序
//
//  Created by Artron_LQQ on 16/3/30.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LQQNameSortTool.h"
#import "ChineseToPinyin.h"

static NSArray *lqq_resultArray = nil;
@interface LQQNameSortTool ()

@property (strong,nonatomic)NSArray *resultArray;
@property (strong,nonatomic)NSMutableDictionary *sourceDic;
@end
@implementation LQQNameSortTool

+ (NSArray*)LQQSortDataByFirstLetterWithArray:(NSArray*)sourceArray isIncludeKeys:(BOOL)isKey{
    
    //按名字的首字母分类
    NSArray *arr = [self LQQSortDataByFirstLetterWithArray:sourceArray];
    if (isKey) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
        //遍历已排序的字母数组
        for (int i = 0;i < lqq_resultArray.count;i++) {
            NSString *key = [lqq_resultArray objectAtIndex:i];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setObject:key forKey:@"key"];
            [dic setObject:[arr objectAtIndex:i] forKey:@"value"];
            [array addObject:dic];
        }
        return array;
    } else {
        return arr;
    }
}

+ (NSArray*)LQQSortDataByFirstLetterWithArray:(NSArray*)sourceArray {
    
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    NSMutableDictionary *sourceDic = [[NSMutableDictionary alloc]init];
    for (NSString *str in sourceArray) {
        
        //判断名称首个汉字是否是多音字
        NSString *firstLetter = [self checkName:str];
        
        //不是的话转换成拼音,并获取首字母
        if (!firstLetter) {
            firstLetter = [NSString stringWithFormat:@"%c",[ChineseToPinyin sortSectionTitle:str]];
        }
        
        //判断该首字母对应的数组是否存在,不存在则创建
        if (![sourceDic objectForKey:firstLetter]) {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            [sourceDic setObject:arr forKey:firstLetter];
        }
        
        //向分类字母数组中添加元素
        [[sourceDic objectForKey:firstLetter] addObject:str];
    }
    
    //把key值按照字母顺序排序
    NSArray *sortArray = [[sourceDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    //记录排序后的字母数组
    lqq_resultArray = sortArray;
    for (NSString *key in sortArray) {
        
        //对这个数组进行字母排序，系统方法就可以对汉字排序，第一个汉字的首字母，第二个字母。。。这样来排序。
        //降序排列,如果升序排列则返回:[obj1 localizedCompare:obj2]
        NSArray *arr = [((NSArray*)[sourceDic objectForKey:key]) sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 localizedCompare:obj1];
        }];

        [resultArray addObject:arr];
    }
    
    return resultArray;
}

//判断多音字
+(NSString*)checkName:(NSString*)name {
    
    if([name hasPrefix:@"曾"])
        return @"Z";
    else if([name hasPrefix:@"解"])
        return @"X";
    else if([name hasPrefix:@"仇"])
        return @"Q";
    else if([name hasPrefix:@"朴"])
        return @"P";
    else if([name hasPrefix:@"查"])
        return @"Z";
    else if([name hasPrefix:@"能"])
        return @"N";
    else if([name hasPrefix:@"乐"])
        return @"Y";
    else if([name hasPrefix:@"单"])
        return @"S";
    else
        return nil;

//    if([self searchResult:string searchText:@"曾"])
//        return @"Z";
//    else if([self searchResult:string searchText:@"解"])
//        return @"X";
//    else if([self searchResult:string searchText:@"仇"])
//        return @"Q";
//    else if([self searchResult:string searchText:@"朴"])
//        return @"P";
//    else if([self searchResult:string searchText:@"查"])
//        return @"Z";
//    else if([self searchResult:string searchText:@"能"])
//        return @"N";
//    else if([self searchResult:string searchText:@"乐"])
//        return @"Y";
//    else if([self searchResult:string searchText:@"单"])
//        return @"S";
//    else
//        return nil;
}

+(BOOL)searchResult:(NSString *)contactName searchText:(NSString *)searchT{
    NSComparisonResult result = [contactName compare:searchT options:NSCaseInsensitiveSearch
                                               range:NSMakeRange(0, searchT.length)];
    if (result == NSOrderedSame)
        return YES;
    else
        return NO;
}

@end
