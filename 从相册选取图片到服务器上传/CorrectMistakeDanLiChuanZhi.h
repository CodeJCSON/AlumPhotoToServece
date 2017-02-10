//
//  CorrectMistakeDanLiChuanZhi.h
//  Pinlehuo
//
//  Created by apple on 15/2/1.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CorrectMistakeDanLiChuanZhi : NSObject

//商户纠错传值属性
@property (nonatomic, strong) NSString *fenlei1_id;
@property (nonatomic, strong) NSString *fenlei2_id;
@property (nonatomic, strong) NSString *fenlei3_id;
@property (nonatomic, strong) NSString *fenlei1_name;
@property (nonatomic, strong) NSString *fenlei2_name;
@property (nonatomic, strong) NSString *fenlei3_name;
@property (nonatomic, strong) NSString *dizhi1_id;
@property (nonatomic, strong) NSString *dizhi1_name;
@property (nonatomic, strong) NSString *dizhi2_id;
@property (nonatomic, strong) NSString *dizhi2_name;
@property (nonatomic, assign) NSInteger number;

//添加商户传值属性
@property (nonatomic, strong) NSString *fenlei1_id1;
@property (nonatomic, strong) NSString *fenlei2_id1;
@property (nonatomic, strong) NSString *fenlei3_id1;
@property (nonatomic, strong) NSString *fenlei1_name1;
@property (nonatomic, strong) NSString *fenlei2_name1;
@property (nonatomic, strong) NSString *fenlei3_name1;
@property (nonatomic, strong) NSString *dizhi1_id1;
@property (nonatomic, strong) NSString *dizhi1_name1;
@property (nonatomic, strong) NSString *dizhi2_id1;
@property (nonatomic, strong) NSString *dizhi2_name1;
@property (nonatomic, assign) NSInteger number1;

@property (nonatomic, strong) NSString *follow_user_id;
//上传图片字典
@property (nonatomic, strong) NSMutableDictionary *dict;
//判断店铺类型
@property (nonatomic, strong) NSString *cat_code;
@property (nonatomic, strong) NSString *supplier_id;
@property (nonatomic, strong) NSString *count;

//第一步：创建声明单例方法
+ (CorrectMistakeDanLiChuanZhi *)shareCorrectMistakeDanLiChuanZhi;

@end
