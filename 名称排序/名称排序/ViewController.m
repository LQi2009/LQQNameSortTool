//
//  ViewController.m
//  名称排序
//
//  Created by Artron_LQQ on 16/3/30.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
//#import "ChineseToPinyin/ChineseToPinyin.h"
#import "LQQNameSortTool.h"

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *nameArray;
@end

@implementation ViewController

- (NSMutableArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan", nil];
    }
    
    return _nameArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = [LQQNameSortTool LQQSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:YES];
    NSArray *arr1 = [LQQNameSortTool LQQSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:NO];
    
    NSLog(@"========%@",arr);
     NSLog(@"========%@",arr1);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
