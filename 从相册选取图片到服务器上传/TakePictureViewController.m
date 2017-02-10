//
//  TakePictureViewController.m
//  Pinlehuo
//
//  Created by liliang on 15/1/15.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import "TakePictureViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <SystemConfiguration/SystemConfiguration.h>
//#import "AFNetworking.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "AFHTTPSessionManager.h"
#import "RequestPostUploadHelper.h"
#import "TakePictureTableViewController.h"
#import "CorrectMistakeDanLiChuanZhi.h"

@interface TakePictureViewController ()< UIPopoverControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate>
{
    NSMutableDictionary *dic;//把图片存放到字典里
    NSInteger count1;//判断图片的个数
}
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UIImageView *imageView2;
@property (nonatomic,strong) UIImageView *imageView3;
@property (nonatomic,strong) UIImageView *imageView4;
@property (nonatomic,strong) UIImageView *imageView5;
@property (nonatomic,strong) UIImageView *imageView6;
@property (nonatomic,strong) UIImageView *imageView7;
@property (nonatomic,strong) UIImageView *imageView8;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) ALAssetsLibrary *specialLibrary;
@property (nonatomic, assign) float jianju;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) float width;
@property (nonatomic, strong) UIActionSheet *sheet;
@end

NSString *TMP_UPLOAD_IMG_PATH=@"";

@implementation TakePictureViewController

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju * 2 + self.width, 64 + self.jianju, self.width, self.height)];
       // [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}
- (UIImageView *)imageView1
{
    if (!_imageView1) {
        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * 2+ self.jianju * 3, 64 + self.jianju, self.width, self.height)];
        //[_imageView1 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView1];
    }
    return _imageView1;
}

- (UIImageView *)imageView2
{
    if (!_imageView2) {
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju, 64 + self.jianju * 2 + self.height, self.width, self.height)];
       // [_imageView2 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView2];
    }
    return _imageView2;
}

- (UIImageView *)imageView4
{
    if (!_imageView4) {
        self.imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * 2 + self.jianju * 3, 64 + self.jianju + self.height + self.jianju, self.width, self.height)];
       // [_imageView4 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView4];
    }
    return _imageView4;
}

- (UIImageView *)imageView3
{
    if (!_imageView3) {
        self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju * 2 + self.width, 64 + self.jianju * 2 + self.height, self.width, self.height)];
       // [_imageView3 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView3];
    }
    return _imageView3;
}

- (UIImageView *)imageView5
{
    if (!_imageView5) {
        self.imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju, 64 + self.jianju * 3 + self.height * 2, self.width, self.height)];
        //[_imageView5 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView5];
    }
    return _imageView5;
}

- (UIImageView *)imageView6
{
    if (!_imageView6) {
        self.imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju * 2 + self.width, 64 + self.jianju * 3 + self.height * 2, self.width, self.height)];
        // [_imageView3 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView6];
    }
    return _imageView6;
}

- (UIImageView *)imageView7
{
    if (!_imageView7) {
        self.imageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju * 3 + self.width * 2, 64 + self.jianju * 3 + self.height * 2, self.width, self.height)];
        // [_imageView3 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView7];
    }
    return _imageView7;
}

- (UIImageView *)imageView8
{
    if (!_imageView8) {
        self.imageView8 = [[UIImageView alloc] initWithFrame:CGRectMake(self.jianju, 64 + self.jianju * 4 + self.height * 3, self.width, self.height)];
        // [_imageView3 setContentMode:UIViewContentModeScaleAspectFit];
        [self.view addSubview:_imageView8];
    }
    return _imageView8;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"相机胶卷";
    self.width = 94;
    self.height = 94;
    self.jianju = (self.view.frame.size.width - (self.width * 3)) / 4;
    self.button.frame = CGRectMake(self.jianju, 64 + self.jianju, self.width, self.height);
   // self.button.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    dic = [NSMutableDictionary dictionary];
    count1 = 0;

    
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleBordered target:self action:@selector(handleButton:)];
    [doneButtonItem setTintColor:[UIColor redColor]];
    
    [self.navigationItem setRightBarButtonItem:doneButtonItem];
}
- (IBAction)handButtonAction:(id)sender {
    _sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开照相机", @"从相册中获取", nil];
    [_sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == _sheet.cancelButtonIndex) {
        NSLog(@"取消");
        
    }
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
        case 1:
            [self LocalPhoto];
            break;
        default:
            break;
    }
}

- (void)takePhoto
{
    UIImagePickerControllerSourceType sourcType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = sourcType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
        //        [self presentModalViewController:picker animated:YES];
        NSLog(@"%@", picker);
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"无法调取相机，请检查" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
        NSLog(@"模拟其中无法打开照相机，请在真机使用");
        return;
    }

}

- (void)LocalPhoto
{
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    
    elcPicker.maximumImagesCount = 9; //选择图像的最大数量设置为9
    elcPicker.returnsOriginalImage = YES; //只返回fullScreenImage,不是fullResolutionImage
    elcPicker.returnsImage = YES; //如果是的 返回UIimage。如果没有,只返回资产位置信息
    elcPicker.onOrder = YES; //对多个图像选择、显示和返回的顺序选择图像
    elcPicker.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie]; //支持图片和电影类型
    
    elcPicker.imagePickerDelegate = self;
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}

//相机
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    [picker dismissViewControllerAnimated:YES completion:^{}];
   
        count1++;
    if (count1 > 9) {
        UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"一次最多只能传9张图片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alerview show];
        return;
    }
    UIImage* image=[info objectForKey:UIImagePickerControllerOriginalImage];
    //把图片保存在本地相册
    [self saveImageToPhotos:image];
    [dic setObject:image forKey:[NSString stringWithFormat:@"%ld", (long)count1]];
    [self dictionary:dic];
    
}

//将图片保存到相册

- (void)saveImageToPhotos:(UIImage*)savedImage

{
    NSLog(@"7");
    UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}


- (void)displayPickerForGroup:(ALAssetsGroup *)group
{
    ELCAssetTablePicker *tablePicker = [[ELCAssetTablePicker alloc] initWithStyle:UITableViewStylePlain];
    tablePicker.singleSelection = YES;
    tablePicker.immediateReturn = YES;
    
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:tablePicker];
    elcPicker.maximumImagesCount = 1;
    elcPicker.imagePickerDelegate = self;
    elcPicker.returnsOriginalImage = YES; //Only return the fullScreenImage, not the fullResolutionImage
    elcPicker.returnsImage = YES; //Return UIimage if YES. If NO, only return asset location information
    elcPicker.onOrder = NO; //For single image selection, do not display and return order of selected images
    tablePicker.parent = elcPicker;
    
    // Move me
    tablePicker.assetGroup = group;
    [tablePicker.assetGroup setAssetsFilter:[ALAssetsFilter allAssets]];
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
}

#pragma mark ELCImagePickerControllerDelegate Methods
//相册
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if (count1 > 8) {
        UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"" message:@"一次最多只能传9张图片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alerview show];
        return;
    }
    for (NSDictionary *dict in info) {
        if ([dict objectForKey:UIImagePickerControllerMediaType] == ALAssetTypePhoto){
            if ([dict objectForKey:UIImagePickerControllerOriginalImage]){
                count1++;
                if (count1 > 9) {
                    [self dictionary:dic];
                    return;
                } else {
                    //把图片取出来放到字典里面
                UIImage* image=[dict objectForKey:UIImagePickerControllerOriginalImage];
                    NSLog(@"%@", image);
                [dic setValue:image forKey:[NSString stringWithFormat:@"%ld", count1]];
                }
                
            }else {
               // NSLog(@"UIImagePickerControllerReferenceURL = %@", dict);
            }
        }else {
           // NSLog(@"Uknown asset type");
        }
    }
    //self.chosenImages = images;
    
    [self dictionary:dic];

}

//把图片展示在页面上
- (void)dictionary:(NSMutableDictionary *)dictionary
{
    //根据字典键的个算给展示imageview
    switch ([dictionary allKeys].count) {
        case 0:
            self.imageView.image = nil;
            self.imageView1.image = nil;
            self.imageView2.image = nil;
            self.imageView3.image = nil;
            self.imageView4.image = nil;
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 1:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = nil;
            self.imageView2.image = nil;
            self.imageView3.image = nil;
            self.imageView4.image = nil;
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 2:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = nil;
            self.imageView3.image = nil;
            self.imageView4.image = nil;
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 3:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = nil;
            self.imageView4.image = nil;
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 4:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = nil;
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 5:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = dictionary[@"5"];
            self.imageView5.image = nil;
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 6:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = dictionary[@"5"];
            self.imageView5.image = dictionary[@"6"];
            self.imageView6.image = nil;
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 7:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = dictionary[@"5"];
            self.imageView5.image = dictionary[@"6"];
            self.imageView6.image = dictionary[@"7"];
            self.imageView7.image = nil;
            self.imageView8.image = nil;
            break;
        case 8:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = dictionary[@"5"];
            self.imageView5.image = dictionary[@"6"];
            self.imageView6.image = dictionary[@"7"];
            self.imageView7.image = dictionary[@"8"];
            self.imageView8.image = nil;
            break;
        case 9:
            self.imageView.image = dictionary[@"1"];
            self.imageView1.image = dictionary[@"2"];
            self.imageView2.image = dictionary[@"3"];
            self.imageView3.image = dictionary[@"4"];
            self.imageView4.image = dictionary[@"5"];
            self.imageView5.image = dictionary[@"6"];
            self.imageView6.image = dictionary[@"7"];
            self.imageView7.image = dictionary[@"8"];
            self.imageView8.image = dictionary[@"9"];
            break;
        default:
            break;
            
    }
    

}

//跳转到上传页面
- (void)handleButton:(id)sender {

    CorrectMistakeDanLiChuanZhi *VC = [CorrectMistakeDanLiChuanZhi shareCorrectMistakeDanLiChuanZhi];
    VC.dict = dic;
   // [[ForwardContainer shareInstance] pushContainer:FORWARD_PICKTURETableView navigationController:self.navigationController params:nil animated:YES];
    TakePictureTableViewController *vc = [[TakePictureTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 指定回调方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo

{NSLog(@"8");
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
    
    NSLog(@"contextInfo = %@", contextInfo);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片结果提示"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

//#pragma mark - Popover Controller Delegate
//
//- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
//{
//    self.popover = nil;
//}
//
//
//#pragma mark - Assets Picker Delegate
//
//- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker isDefaultAssetsGroup:(ALAssetsGroup *)group
//{
//    return ([[group valueForProperty:ALAssetsGroupPropertyType] integerValue] == ALAssetsGroupSavedPhotos);
//}
//
//- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
//{
//    if (self.popover != nil)
//        [self.popover dismissPopoverAnimated:YES];
//    else
//        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
//    
//    self.assets = [NSMutableArray arrayWithArray:assets];
//    [_tableView reloadData];
//}
//
//- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldEnableAsset:(ALAsset *)asset
//{
//    // Enable video clips if they are at least 5s
//    if ([[asset valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo])
//    {
//        NSTimeInterval duration = [[asset valueForProperty:ALAssetPropertyDuration] doubleValue];
//        return lround(duration) >= 5;
//    }
//    else
//    {
//        return YES;
//    }
//}
//
//- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(ALAsset *)asset
//{
//    if (picker.selectedAssets.count >= 10)
//    {
//        UIAlertView *alertView =
//        [[UIAlertView alloc] initWithTitle:@"Attention"
//                                   message:@"Please select not more than 10 assets"
//                                  delegate:nil
//                         cancelButtonTitle:nil
//                         otherButtonTitles:@"OK", nil];
//        
//        [alertView show];
//    }
//    
//    if (!asset.defaultRepresentation)
//    {
//        UIAlertView *alertView =
//        [[UIAlertView alloc] initWithTitle:@"Attention"
//                                   message:@"Your asset has not yet been downloaded to your device"
//                                  delegate:nil
//                         cancelButtonTitle:nil
//                         otherButtonTitles:@"OK", nil];
//        
//        [alertView show];
//    }
//    
//    return (picker.selectedAssets.count < 10 && asset.defaultRepresentation != nil);
//}
//
//-(void)takePhoto{
//    //资源类型为照相机
//    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
//    //判断是否有相机
//    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        
//        //设置拍照后的图片可被编辑
//        picker.allowsEditing = YES;
//        
//        //资源类型为照相机
//        picker.sourceType = sourceType;
//        
//        [self presentModalViewController:picker animated:YES];
//    }else {
//        
//        NSLog(@"该设备无摄像头");
//    }
//}


@end
