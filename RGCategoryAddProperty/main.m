//
//  main.m
//  RGCategoryAddProperty
//
//  Created by yangrui on 2019/1/7.
//  Copyright © 2019年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <objc/runtime.h>
#import "Person.h"
#import "Person+addProperty.h" // 利用字典给category 关联对象

#import "Person+associationPolicy.h" // 利用runtime API 给Category 关联属性

// category 关联属性方式一, 字典关联方式
void test1(){
    Person *pson = [[Person alloc] init];
    pson.weight = 50;
    Person *pson1 = [[Person alloc] init];
    pson1.weight = 60;
    Person *pson2 = [[Person alloc] init];
    pson2.weight = 70;
    
    NSLog(@"%d", pson.weight);
    NSLog(@"%d", pson1.weight);
    NSLog(@"%d", pson2.weight);
}


void test2(){
    Person *pson1 = [[Person alloc] init];
    pson1.name = @"zhangsan";
    
    Person *pson2 = [[Person alloc] init];
    pson2.name = @"lisi";
    
    NSLog(@"pson1 : %@", pson1.name);
    NSLog(@"pson2 : %@", pson2.name);
}


extern  const void *nameKey;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        
//        test1();
        test2();
        Person *pp = [[Person alloc]init];
        
        
        {
            
            Person *pson = [[Person alloc]init];
            NSLog(@"--p----%p", pson);
            objc_setAssociatedObject(pp, @"pson", pson, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
        }
        NSLog(@"------%p", objc_getAssociatedObject(pp, @"pson"));
         
        
       
    }
    return 0;
}



