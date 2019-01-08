//
//  Person+addProperty.m
//  RGCategoryAddProperty
//
//  Created by yangrui on 2019/1/8.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#import "Person+addProperty.h"

#define pKey [NSString stringWithFormat:@"%p",self] // 新增的属性key,将内存地址作为Key, 保证唯一性

@implementation Person (addProperty)

//category 添加一个成员变量
// 方案一: 给 category 内新增一个 全局的字典,实例对象 内存地址作为key 访问


NSMutableDictionary *properyDicM_ = nil;
+(void)load{
    //在load中初始化全局的变量,这样保证对象调用前已经初始化
   properyDicM_ = [NSMutableDictionary dictionary];
}


-(int)weight{
    return [properyDicM_[pKey] intValue];
}

-(void)setWeight:(int)weight{
    properyDicM_[pKey] = @(weight);
 }

@end
