//
//  TakePictureTableViewController.h
//  Pinlehuo
//
//  Created by liliang on 15/2/6.
//  Copyright (c) 2015年 Nee. All rights reserved.
//

#import "ViewController.h"

@interface TakePictureTableViewController : ViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *tableview;
}

@end
