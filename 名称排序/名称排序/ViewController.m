//
//  ViewController.m
//  名称排序
//
//  Created by Artron_LQQ on 16/3/30.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZSortTool.h"

@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *nameArray;
@end

@implementation ViewController

- (NSMutableArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan",@"angelababy",@"Angelababy", nil];
    }
    
    return _nameArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = [LZSortTool LZSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:YES];
    NSArray *arr1 = [LZSortTool LZSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:NO];
    
    NSLog(@"arr======%@",arr);
     NSLog(@"arr1======%@",arr1);
    
    /*
     arr======(
     {
     key = C;
     value =         (
     "成龙"
     );
     },
     {
     key = F;
     value =         (
     "范冰冰"
     );
     },
     {
     key = H;
     value =         (
     "黄蓉",
     "黄晓明",
     "霍建华"
     );
     },
     {
     key = L;
     value =         (
     "鲁迅",
     "李连杰",
     "李小龙",
     "李天王",
     "李三",
     "刘一",
     LiShan
     );
     },
     {
     key = N;
     value =         (
     "哪吒"
     );
     },
     {
     key = Q;
     value =         (
     "钱"
     );
     },
     {
     key = S;
     value =         (
     "孙悟空",
     "孙五"
     );
     },
     {
     key = W;
     value =         (
     "王二"
     );
     },
     {
     key = Z;
     value =         (
     "赵四",
     "赵丽颖",
     "曾小贤"
     );
     }
     )
     
    arr1======(
     (
     "成龙"
     ),
     (
     "范冰冰"
     ),
     (
     "黄蓉",
     "黄晓明",
     "霍建华"
     ),
     (
     "鲁迅",
     "李连杰",
     "李小龙",
     "李天王",
     "李三",
     "刘一",
     LiShan
     ),
     (
     "哪吒"
     ),
     (
     "钱"
     ),
     (
     "孙悟空",
     "孙五"
     ),
     (
     "王二"
     ),
     (
     "赵四",
     "赵丽颖",
     "曾小贤"
     )
     )
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
