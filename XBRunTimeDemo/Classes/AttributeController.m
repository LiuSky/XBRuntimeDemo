//
//  AttributeController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/4.
//  Copyright © 2019 Sky. All rights reserved.
//

#import "AttributeController.h"



/**
 3.1 获取一个属性
 objc_property_t class_getProperty(Class cls, const char *name)
 
 3.2 拷贝属性列表（最后需要调用free释放）
 objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)
 
 3.3 动态添加属性
 BOOL class_addProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
 
 3.4 动态替换属性
 void class_replaceProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
 
 3.5 获取属性的一些信息
 const char *property_getName(objc_property_t property)
 const char *property_getAttributes(objc_property_t property)
 */
@interface AttributeController ()

@end

@implementation AttributeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"属性";
}
@end
