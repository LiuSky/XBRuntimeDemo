//
//  Person.h
//  XBRunTimeDemo
//
//  Created by xiaobin liu on 2019/2/28.
//  Copyright © 2019 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong)NSCache *cache;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString *name;

@end

NS_ASSUME_NONNULL_END
