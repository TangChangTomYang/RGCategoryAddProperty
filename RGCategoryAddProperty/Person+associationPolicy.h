//
//  Person+associationPolicy.h
//  RGCategoryAddProperty
//
//  Created by yangrui on 2019/1/8.
//  Copyright © 2019年 yangrui. All rights reserved.
//  方案二: 使用runtime 关联对象技术,为分类增加成员变量

#import "Person.h"

@interface Person (associationPolicy)
 
@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *sex;

@property(nonatomic, strong)NSString *childName;

@property(nonatomic, strong)NSString *homeAddress;
@end
