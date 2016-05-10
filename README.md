#LZSortTool

一个对汉字姓名进行按首字母分组排序的工具;
<br>其中使用了一个开源的将汉字转换为拼音的工具类:`ChineseToPinyin`

#接口
这个工具只提供了一个接口,用于传入需要排序的字符串

```
+ (NSArray*)LZSortDataByFirstLetterWithArray:(NSArray*)sourceArray isIncludeKeys:(BOOL)isKey;
```
`sourceArray`为需要排序的字符串数组,`isKey`是在返回的结果数组中是否包含分组的`key`值;
例如,对以下数组的内容进行排序:
```
- (NSMutableArray *)nameArray {
 if (!_nameArray) {
  _nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan", nil];
 }
 
 return _nameArray;
}
```
当`isKey`的值不同时:
```
如果isKey为YES,则返回的数组元素为字典,字典包含两个键值对,例如:
 (
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
 
 ----
 * 如果isKey为NO,则返回的数组元素为数组,数组包含分组后的元素,例如:
  (
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


```
#使用
```
NSArray *arr = [LZSortTool LZSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:YES];
NSArray *arr1 = [LZSortTool LZSortDataByFirstLetterWithArray:self.nameArray isIncludeKeys:NO];
```

###如果对你有帮助,还请star鼓励一下;
###本人博客地址:[我的博客](http://blog.csdn.net/lqq200912408),欢迎访问,共同学习!
