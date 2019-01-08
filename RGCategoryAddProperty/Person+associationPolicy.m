//
//  Person+associationPolicy.m
//  RGCategoryAddProperty
//
//  Created by yangrui on 2019/1/8.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#import "Person+associationPolicy.h"
#import <objc/runtime.h>

@implementation Person (associationPolicy)

// runtime 方式一: key 不安全,外面可以访问
//const void *nameKey = &nameKey;

// 改进方式二: 在前面添加static 稍微安全
static const void *nameKey = &nameKey;
-(void)setName:(NSString *)name{
    // 使用 OBJC_ASSOCIATION_COPY_NONATOMIC 这种策略, 用 nameKey 关键字, 给 self 关联一个 name 值
    objc_setAssociatedObject(self , nameKey,name , OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)name{
    // 通过关键字nameKey 获取self 关联的值
   return  objc_getAssociatedObject(self, nameKey);
}


// 改进方案三: 更节约空间
static const char sexKey;
-(void)setSex:(NSString *)sex{
    objc_setAssociatedObject(self, &sexKey, sex, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)sex{
   return  objc_getAssociatedObject(self, &sexKey);
}


// 改进方案四: 见名知义
-(void)setChildName:(NSString *)childName{
    objc_setAssociatedObject(self, @"childName", childName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)childName{
    return  objc_getAssociatedObject(self, @"childName");
}


// 改进方案五: 见名知义, 防止key 写错, 推荐写法
-(void)setHomeAddress:(NSString *)homeAddress{
    // 如果self 这个对象都消失了的话, 那么 self 关联的值也会销毁
    objc_setAssociatedObject(self, @selector(homeAddress), homeAddress, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)homeAddress{
    return  objc_getAssociatedObject(self, @selector(homeAddress));
    
    // 也可以写成   _cmd 等价于 @selector(homeAddress)
//     return  objc_getAssociatedObject(self, _cmd);
}
@end
