//
//  CorrectMistakeDanLiChuanZhi.m
//  Pinlehuo
//
//  Created by apple on 15/2/1.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import "CorrectMistakeDanLiChuanZhi.h"

@implementation CorrectMistakeDanLiChuanZhi

- (NSMutableDictionary *)dict
{
    if (!_dict) {
        self.dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

//第二步：实现声明单例方法
+ (CorrectMistakeDanLiChuanZhi *)shareCorrectMistakeDanLiChuanZhi
{
    static CorrectMistakeDanLiChuanZhi *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[CorrectMistakeDanLiChuanZhi alloc] init];
    });
    return singleton;
}

@end
