//
//  TakePictureTableViewController.m
//  Pinlehuo
//
//  Created by liliang on 15/2/6.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import "TakePictureTableViewController.h"
#import "TakePictureTableViewCell.h"
#import "CorrectMistakeDanLiChuanZhi.h"
#import "RequestPostUploadHelper.h"

@interface TakePictureTableViewController ()
{
    CorrectMistakeDanLiChuanZhi *VC;
    NSArray *keys;
    //记录每个cell上传服务器的key值
    NSString *str1;
    NSString *str2;
    NSString *str3;
    NSString *str4;
    NSString *str5;
    NSString *str6;
    NSString *str7;
    NSString *str8;
    NSString *str9;
    //记录每个cell上button的点击状态
    NSInteger count1;
    NSInteger count2;
    NSInteger count3;
    NSInteger count4;
    NSInteger count5;
    NSInteger count6;
    NSInteger count7;
    NSInteger count8;
    NSInteger count9;
}
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation TakePictureTableViewController

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (NSMutableDictionary *)dict
{
    if (!_dict) {
        self.dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"图片";
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerNib:[UINib nibWithNibName:@"TakePictureTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
   // self.view.backgroundColor = FORWARD_COLOR;
   // tableview.backgroundColor = FORWARD_COLOR;
    
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(handleButton:)];
    [doneButtonItem setTintColor:[UIColor redColor]];
    
    [self.navigationItem setRightBarButtonItem:doneButtonItem];
    
    tableview.tableFooterView = [[UIView alloc] init];
    tableview.separatorColor=[UIColor whiteColor];
    VC = [CorrectMistakeDanLiChuanZhi shareCorrectMistakeDanLiChuanZhi];
    keys= [VC.dict allKeys];
}

- (void)handleButton:(UIButton *)sender
{
    NSMutableDictionary * dir=[NSMutableDictionary dictionary];
    //需要上传服务器的参数
    [dir setValue:VC.supplier_id forKey:@"supplier_id"];
    
   // [dir setValue:[PLHDefaultManagement instance].userPlh.user_id forKey:@"user_id"];
    NSString *url = @"http://mobile.pinlehuo.com/api.php?m=MemberOper&a=supplierPicsUpload";

    [self addDict:[VC.dict allKeys].count];
    //上传服务器
    //url为上传的地址   dir为需要上传的参数  VC.dict为需要上传的图片  self.dict为图片对应的file值，也就是key值
    [RequestPostUploadHelper PostImagesToServer:url dicPostParams:dir dicImages:VC.dict dicStr:self.dict];
    NSLog(@"-------------%@", VC.dict);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请去服务器查看图片是否上传成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
  //  [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
    
}

- (void)addDict:(NSInteger)count
{
    //把每张图片的分类按照图片的顺序放到字典中，注意key值要和上一个页面传过来的保持一致，如果从1开始那都要从1开始，按照顺序来
    switch (count) {
        case 0:
            self.dict = nil;
            break;
        case 1:
            //如果用户没有选择图片的分类，就默认为@"other[]"
            //加[] 当上传多张图片且每个图片的分类一样时会把同一种分类的图片自动放到一个数组中，不会被覆盖掉。。。所以一定要注意
            if (!str1) {
                str1 = @"other[]";
            }
            NSLog(@"%@", str1);
            [self.dict setObject:str1 forKey:@"1"];
            break;
        case 2:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            break;
        case 3:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            break;
        case 4:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            break;
        case 5:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            if (!str5) {
                str5 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            [self.dict setObject:str5 forKey:@"5"];
            break;
        case 6:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            if (!str5) {
                str5 = @"other[]";
            }
            if (!str6) {
                str6 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            [self.dict setObject:str5 forKey:@"5"];
            [self.dict setObject:str6 forKey:@"6"];
            break;
        case 7:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            if (!str5) {
                str5 = @"other[]";
            }
            if (!str6) {
                str6 = @"other[]";
            }
            if (!str7) {
                str7 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            [self.dict setObject:str5 forKey:@"5"];
            [self.dict setObject:str6 forKey:@"6"];
            [self.dict setObject:str7 forKey:@"7"];
            break;
        case 8:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            if (!str5) {
                str5 = @"other[]";
            }
            if (!str6) {
                str6 = @"other[]";
            }
            if (!str7) {
                str7 = @"other[]";
            }
            if (!str8) {
                str8 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            [self.dict setObject:str5 forKey:@"5"];
            [self.dict setObject:str6 forKey:@"6"];
            [self.dict setObject:str7 forKey:@"7"];
            [self.dict setObject:str8 forKey:@"8"];
            break;
        case 9:
            if (!str1) {
                str1 = @"other[]";
            }
            if (!str2) {
                str2 = @"other[]";
            }
            if (!str3) {
                str3 = @"other[]";
            }
            if (!str4) {
                str4 = @"other[]";
            }
            if (!str5) {
                str5 = @"other[]";
            }
            if (!str6) {
                str6 = @"other[]";
            }
            if (!str7) {
                str7 = @"other[]";
            }
            if (!str8) {
                str8 = @"other[]";
            }
            if (!str9) {
                str9 = @"other[]";
            }
            [self.dict setObject:str1 forKey:@"1"];
            [self.dict setObject:str2 forKey:@"2"];
            [self.dict setObject:str3 forKey:@"3"];
            [self.dict setObject:str4 forKey:@"4"];
            [self.dict setObject:str5 forKey:@"5"];
            [self.dict setObject:str6 forKey:@"6"];
            [self.dict setObject:str7 forKey:@"7"];
            [self.dict setObject:str8 forKey:@"8"];
            [self.dict setObject:str9 forKey:@"9"];
            break;
        default:
            break;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [VC.dict allKeys].count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    TakePictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if ([VC.cat_code isEqualToString:@"cate"]) {
        [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai.png"] forState:(UIControlStateNormal)];
    } else {
        [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai.png"] forState:(UIControlStateNormal)];

    }
    
    
    
    cell.imageview.image = [VC.dict objectForKey:keys[indexPath.row]];
    [cell.button1 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.button1.tag = indexPath.row + 11;
    [cell.huanjingButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.huanjingButton.tag = indexPath.row + 21;
    [cell.jiamubiaoButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.jiamubiaoButton.tag = indexPath.row + 31;
    [cell.qitaButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.qitaButton.tag = indexPath.row + 41;
    //去掉cell点击后的背景色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.button1.backgroundColor = [UIColor clearColor];
    cell.qitaButton.backgroundColor = [UIColor clearColor];
    cell.jiamubiaoButton.backgroundColor = [UIColor clearColor];
    cell.huanjingButton.backgroundColor = [UIColor clearColor];
    
    //防止cell重用问题，根据每个cell记录的参数来确定每个cell上点击的是哪一个button
    switch (indexPath.row) {
        case 0:
            switch (count1) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:
    
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:
                 
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (count2) {
                case 1:
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;

                default:
                    break;
            }
            break;
        case 2:
            switch (count3) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;

                default:
                    break;
            }
            break;
        case 3:
            switch (count4) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;

                default:
                    break;
            }
            break;
        case 4:
            switch (count5) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;

                default:
                    break;
            }
            break;
        case 5:
            switch (count6) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;
                default:
                    break;
            }
            break;
        case 6:
            switch (count7) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;
                default:
                    break;
            }
            break;
        case 7:
            switch (count8) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:
 
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;

                default:
                    break;
            }
            break;
        case 8:
            switch (count9) {
                case 1:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:

                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:
  
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:
   
                    [cell.button1 setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;
                default:
                    break;
            }
            break;
       
        default:
            break;
    }
    
    
    return cell;
}

- (void)handleButtonAction:(UIButton *)sender
{
    
    NSInteger number = sender.tag % 10;
    number += 10;
    //每点击一次button都先把button上的图片恢复默认状态
    for (NSInteger i = number ; i <= 50; i += 10) {
        UIButton *button = (UIButton *)[self.view viewWithTag:i];
        //根据点击每个cell上的button的tag判断
        switch (i / 10) {
            case 1:
                [button setBackgroundImage:[UIImage imageNamed:@"cai.png"] forState:(UIControlStateNormal)];
                break;
            case 2:
                [button setBackgroundImage:[UIImage imageNamed:@"huanjing.png"] forState:(UIControlStateNormal)];
                break;
            case 3:
                [button setBackgroundImage:[UIImage imageNamed:@"jiamubiao.png"] forState:(UIControlStateNormal)];
                break;
            case 4:
                [button setBackgroundImage:[UIImage imageNamed:@"qita.png"] forState:(UIControlStateNormal)];
                break;
            default:
                break;
        }
    }
    
    
    //根据button的tag / 10 值 判断点击的是哪个cell
    switch (sender.tag / 10) {
        case 1:
            //根据button的tag % 10 值 判断点击的是cell上的哪一个button
            //count1，count2，count3。。。来记录点击的是cell上的哪一个button
            switch (sender.tag % 10) {
                case 1:
                    //str1 每个button对应的图片上传服务器的file值
                    str1 = @"effect[]";
                    count1 = 1;
                    
                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:
                    str2 = @"effect[]";
                    count2 = 1;

                     [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 3:
                    str3 = @"effect[]";
                    count3 = 1;

                     [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 4:
                    str4 = @"effect[]";
                    count4 = 1;

                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    break;
                case 5:
                    count5 = 1;

                    str5 = @"effect[]";
                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 6:
                    count6 = 1;

                    str6 = @"effect[]";
                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 7:
                    count7 = 1;

                    str7 = @"effect[]";
                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 8:
                    str8 = @"effect[]";
                    count8 = 1;

                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                case 9:
                    str9 = @"effect[]";
                    count9 = 1;

                    [sender setBackgroundImage:[UIImage imageNamed:@"cai1.png"] forState:(UIControlStateNormal)];
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (sender.tag % 20) {
                case 1:
                    str1 = @"environment[]";
                    count1 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    break;
                case 2:
                    count2 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str2 = @"environment[]";
                    break;
                case 3:
                    count3 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str3 = @"environment[]";
                    break;
                case 4:
                    count4 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str4 = @"environment[]";
                    break;
                case 5:
                    count5 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str5 = @"environment[]";
                    break;
                case 6:
                    count6 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str6 = @"environment[]";
                    break;
                case 7:
                    count7 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str7 = @"environment[]";
                    break;
                case 8:
                    count8 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str8 = @"environment[]";
                    break;
                case 9:
                    count9 = 2;
                    [sender setBackgroundImage:[UIImage imageNamed:@"huanjing1.png"] forState:(UIControlStateNormal)];
                    str9 = @"environment[]";
                    break;
                default:
                    break;
            }

            break;
        case 3:
            switch (sender.tag % 30) {
                case 1:
                    count1 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str1 = @"tariff[]";
                    break;
                case 2:
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    count2 = 3;

                    str2 = @"tariff[]";
                    break;
                case 3:
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str3 = @"tariff[]";
                    break;
                case 4:
                    count4 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str4 = @"tariff[]";
                    break;
                case 5:
                    count5 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str5 = @"tariff[]";
                    break;
                case 6:
                    count6 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str6 = @"tariff[]";
                    break;
                case 7:
                    count7 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str7 = @"tariff[]";
                    break;
                case 8:
                    count8 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str8 = @"tariff[]";
                    break;
                case 9:
                    count9 = 3;
                    [sender setBackgroundImage:[UIImage imageNamed:@"jiamubiao1.png"] forState:(UIControlStateNormal)];
                    str9 = @"tariff[]";
                    break;
                default:
                    break;
            }

            break;
        case 4:
            switch (sender.tag % 40) {
                case 1:
                    count1 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str1 = @"other[]";
                    break;
                case 2:
                    count2 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str2 = @"other[]";
                    break;
                case 3:
                    count3 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str3 = @"other[]";
                    break;
                case 4:
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str4 = @"other[]";
                    break;
                case 5:
                    count5 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str5 = @"other[]";
                    break;
                case 6:
                    count6 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str6 = @"other[]";
                    break;
                case 7:
                    count7 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str7 = @"other[]";
                    break;
                case 8:
                    count8 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str8 = @"other[]";
                    break;
                case 9:
                    count9 = 4;
                    [sender setBackgroundImage:[UIImage imageNamed:@"qita1.png"] forState:(UIControlStateNormal)];
                    str9 = @"other[]";
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
