//
//  MethodController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/4.
//  Copyright © 2019 Sky. All rights reserved.
//

#import "MethodController.h"


/**
 4.1 获得一个实例方法、类方法
 Method class_getInstanceMethod(Class cls, SEL name)
 Method class_getClassMethod(Class cls, SEL name)
 
 4.2 方法实现相关操作
 IMP class_getMethodImplementation(Class cls, SEL name)
 IMP method_setImplementation(Method m, IMP imp)
 void method_exchangeImplementations(Method m1, Method m2)
 
 4.3 拷贝方法列表（最后需要调用free释放）
 Method *class_copyMethodList(Class cls, unsigned int *outCount)
 
 4.4 动态添加方法
 BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
 
 4.5 动态替换方法
 IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
 
 4.6 获取方法的相关信息（带有copy的需要调用free去释放）
 SEL method_getName(Method m)
 IMP method_getImplementation(Method m)
 const char *method_getTypeEncoding(Method m)
 unsigned int method_getNumberOfArguments(Method m)
 char *method_copyReturnType(Method m)
 char *method_copyArgumentType(Method m, unsigned int index)
 
 4.7 选择器相关
 const char *sel_getName(SEL sel)
 SEL sel_registerName(const char *str)
 
 4.8 用block作为方法实现
 IMP imp_implementationWithBlock(id block)
 id imp_getBlock(IMP anImp)
 BOOL imp_removeBlock(IMP anImp)
 */
@interface MethodController ()

@end

@implementation MethodController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"方法";
}

@end
