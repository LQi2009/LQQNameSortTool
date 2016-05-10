//
//  LZSortTool.h
//  名称排序
//
//  Created by Artron_LQQ on 16/5/10.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZSortTool : NSObject

/*对一组汉字名称,按照首个汉字的首字母进行分组排序
 * sourceArray  待分组排序的汉字集合
 * isKey 是否包含排序后的字母,例如:A
 * return 返回一个排序分组后的数组
 */
+ (NSArray*)LZSortDataByFirstLetterWithArray:(NSArray*)sourceArray isIncludeKeys:(BOOL)isKey;
@end
