//
//  AttributeController.m
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/1/4.
//  Copyright © 2019 Sky. All rights reserved.
//

#import "AttributeController.h"
#import <objc/runtime.h>
#import "Person.h"


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
    
    [self getProperties];
    [self updateVariable];
}

/** 获取属性列表 */
-(void)getProperties{
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        const char *attributes = property_getAttributes(properties[i]);
        NSString *str = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSString *attributesStr = [NSString stringWithCString:attributes encoding:NSUTF8StringEncoding];
        NSLog(@"propertyName : %@", str);
        NSLog(@"attributesStr : %@", attributesStr);
    }
}

/** 修改变量 */
- (id)updateVariable
{
    //获取当前类
    id theClass = [self class];
    //初始化
    id otherClass = [[Person alloc] init];
    
    unsigned int count = 0;
    //获取属性列表
    Ivar *members = class_copyIvarList([Person class], &count);
    
    //遍历属性列表
    for (int i = 0 ; i < count; i++) {
        Ivar var = members[i];
        //获取变量名称
        const char *memberName = ivar_getName(var);
        //获取变量类型
        const char *memberType = ivar_getTypeEncoding(var);
        
        NSLog(@"%s----%s", memberName, memberType);
        
        Ivar ivar = class_getInstanceVariable([otherClass class], memberName);
        
        NSString *typeStr = [NSString stringWithCString:memberType encoding:NSUTF8StringEncoding];
        //判断类型
        if ([typeStr isEqualToString:@"@\"NSString\""]) {
            //修改值
            object_setIvar(otherClass, ivar, @"abc");
        }else{
            object_setIvar(otherClass, ivar, [NSNumber numberWithInt:99]);
        }
    }
    return otherClass;
}
@end
