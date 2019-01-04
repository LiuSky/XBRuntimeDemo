//
//  MemberVariablesController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/4.
//  Copyright © 2019 Sky. All rights reserved.
//

#import "MemberVariablesController.h"
#import <objc/runtime.h>

@interface XBPersion : NSObject
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)NSInteger weight;
@property(nonatomic,copy)NSString *name;
@end

@implementation XBPersion
@end



/**
 2.1 获取一个实例变量信息
 Ivar class_getInstanceVariable(Class cls, const char *name)
 
 2.2 获取成员变量的相关信息
 const char *ivar_getName(Ivar v)
 const char *ivar_getTypeEncoding(Ivar v)
 
 2.3 设置和获取成员变量的值
 void object_setIvar(id obj, Ivar ivar, id value)
 id object_getIvar(id obj, Ivar ivar)
 
 2.4 动态添加成员变量（已经注册的类是不能动态添加成员变量的）
 BOOL class_addIvar(Class cls, const char * name, size_t size, uint8_t alignment, const char * types)
 
 2.5 拷贝实例变量列表（最后需要调用free释放）
 Ivar *class_copyIvarList(Class cls, unsigned int *outCount)
 */
@interface MemberVariablesController ()
@end

@implementation MemberVariablesController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"成员变量";
    
    //获取一个实例变量信息
    Ivar ageIvar = class_getInstanceVariable([XBPersion class], "_age");
    
    //获取成员变量的相关信息
    NSLog(@"%s %s", ivar_getName(ageIvar), ivar_getTypeEncoding(ageIvar));
    
    //设置和获取成员变量的值
    XBPersion *persion = [[XBPersion alloc]init];
    Ivar nameIvar = class_getInstanceVariable([XBPersion class], "_name");
    
    object_setIvar(persion, ageIvar, (__bridge id)(void *)10);
    object_setIvar(persion, nameIvar, @"1234");
    NSLog(@"%@  %l", persion.name, persion.age);
    
    
    
    // 4.成员变量的数量
    unsigned int count;
    Ivar *ivars = class_copyIvarList([XBPersion class], &count);
    for (int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    free(ivars);
}
@end
