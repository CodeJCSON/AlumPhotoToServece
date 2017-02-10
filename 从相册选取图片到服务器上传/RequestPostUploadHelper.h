//
//  RequestPostUploadHelper.h
//  从相册选取图片到服务器上传
//
//  Created by liliang on 15/2/5.
//  Copyright (c) 2015年 秦晓康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestPostUploadHelper : NSObject
+ (NSString *)PostImagesToServer:(NSString *)strUrl
                   dicPostParams:(NSMutableDictionary *)params
                       dicImages:(NSMutableDictionary *)dicImages
                             dicStr:(NSMutableDictionary *)dicStr;
@end
