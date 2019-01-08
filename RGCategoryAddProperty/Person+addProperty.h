//
//  Person+addProperty.h
//  RGCategoryAddProperty
//
//  Created by yangrui on 2019/1/8.
//  Copyright © 2019年 yangrui. All rights reserved.
// 方案一: 添加全局的可变字典, 存储 相应的变量
// 存在线程安全问题
// 使用相对麻烦(每新增一个属性需要新增一个字典)

#import "Person.h"

@interface Person (addProperty)

@property(nonatomic, assign)int weight;
@end
