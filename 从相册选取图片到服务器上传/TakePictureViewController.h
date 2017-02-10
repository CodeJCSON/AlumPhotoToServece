//
//  TakePictureViewController.h
//  Pinlehuo
//
//  Created by liliang on 15/1/15.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import "ViewController.h"
#import "ELCImagePickerHeader.h"

@interface TakePictureViewController : ViewController<UINavigationControllerDelegate,ELCImagePickerControllerDelegate>
@property (nonatomic, copy) NSMutableArray *chosenImages;

@end
