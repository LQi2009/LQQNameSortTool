//
//  LQQNameSortTool.h
//  名称排序
//
//  Created by Artron_LQQ on 16/3/30.
//  Copyright © 2016年 Artup. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface LQQNameSortTool : NSObject


/*对一组汉字名称,按照首个汉字的首字母进行分组排序
 * sourceArray  待分组排序的汉字集合
 * isKey 是否包含排序后的字母,例如:A
 * return 返回一个排序分组后的数组
 * 如果isKey为YES,则返回的数组元素为字典,字典包含两个键值对,例如:
 (
    {
        key = F;
        value = (
                "范冰冰"
                );
    },
    {
        key = H;
        value = (
                "黄蓉",
                "黄晓明",
                "霍建华"
                );
    },
 )
 * 如果isKey为NO,则返回的数组元素为数组,数组包含分组后的元素,例如:
  (
    (
    "范冰冰"
    ),
    (
    "黄蓉",
    "黄晓明",
    "霍建华"
    )
)
 */
+ (NSArray*)LQQSortDataByFirstLetterWithArray:(NSArray*)sourceArray isIncludeKeys:(BOOL)isKey;
@end
