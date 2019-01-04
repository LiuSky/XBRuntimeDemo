//
//  ClassController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/4.
//  Copyright © 2019 Sky. All rights reserved.
//

#import "ClassController.h"
#import <objc/runtime.h>


@interface CSPersion : NSObject
- (void)run;
@end

@implementation CSPersion
- (void)run {
    NSLog(@"%s", __func__);
}
@end


@interface CSCar : NSObject
- (void)run;
@end

@implementation CSCar
- (void)run {
    NSLog(@"%s", __func__);
}
@end


/**
 1.1 动态创建一个类（参数：父类，类名，额外的内存空间）
 Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
 
 1.2 注册一个类（要在类注册之前添加成员变量）
 void objc_registerClassPair(Class cls)
 
 1.3 销毁一个类
 void objc_disposeClassPair(Class cls)
 
 1.4 获取isa指向的Class
 Class object_getClass(id obj)
 
 1.5 设置isa指向的Class
 Class object_setClass(id obj, Class cls)
 
 1.6 判断一个OC对象是否为Class
 BOOL object_isClass(id obj)
 
 1.7 判断一个Class是否为元类
 BOOL class_isMetaClass(Class cls)
 
 1.8 获取父类
 Class class_getSuperclass(Class cls)
 */
@interface ClassController ()

@end

@implementation ClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"类相关的Runtime";
    [self dynamicCreateClass];
    [self isa];
}




/**
 动态创建一个类
 */
-(void)dynamicCreateClass {
    
    //1.1 动态创建一个类（参数：父类，类名，额外的内存空间）
    Class newClass = objc_allocateClassPair([NSObject class], "XBDog", 0);
    
    // 添加属性
    class_addIvar(newClass, "age", 4, 1, @encode(int));
    class_addIvar(newClass, "weight", 4, 1, @encode(int));
    
    // 添加方法
    class_addMethod(newClass, @selector(run), (IMP)run, "v@:");
    
    // 注册类
    objc_registerClassPair(newClass);
    
    
    id dog = [[newClass alloc]init];
    [dog setValue:@10 forKey:@"age"];
    [dog setValue:@10 forKey:@"weight"];
    [dog run];
    
    // 在不需要这个类时释放
    //objc_disposeClassPair(newClass);
}

void run(id self, SEL _cmd) {
    NSLog(@"_____ %@ - %@", self, NSStringFromSelector(_cmd));
}



/**
 isa方法
 */
-(void)isa {
    
    CSPersion *persion = [[CSPersion alloc]init];
    [persion run];
    
    //设置isa指向的Class
    object_setClass(persion, [CSCar class]);
    [persion run];
    
    //获取isa指向的Class
    object_getClass([CSPersion class]);
    
    NSLog(@"%p %p", object_getClass([CSPersion class]), [CSPersion class]);
    
    NSLog(@"%d %d %d",
          object_isClass(persion),
          object_isClass([CSPersion class]),
          object_isClass(object_getClass([CSPersion class]))
         );
    
    //判断一个Class是否为元类
    BOOL isMetaClass = class_isMetaClass(object_getClass([CSPersion class]));
    NSLog(@"%d", isMetaClass);
    
    //获取父类
    id superClass = class_getSuperclass([CSPersion class]);
    NSLog(@"%p", superClass);
}


@end



