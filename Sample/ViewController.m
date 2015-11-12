//
//  ViewController.m
//  Sample
//
//  Created by Celleus on 2015/11/12.
//  Copyright © 2015年 Celleus. All rights reserved.
//

#import "ViewController.h"

#import <MEMEDev/MEMEDev.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray *dataArray;
    NSMutableArray *dataTitleArray;
    UITableView *dataTableView;
}

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    dataArray = [[NSMutableArray alloc] init];
    dataTitleArray = [[NSMutableArray alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"データチェック";
    
    dataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                 style:UITableViewStylePlain];
    dataTableView.delegate = self;
    dataTableView.dataSource = self;
    dataTableView.backgroundColor = [UIColor whiteColor];
    dataTableView.separatorColor = [UIColor darkGrayColor];
    [self.view addSubview:dataTableView];
    
    [MEMEDev sharedInstance].delegate = self;
    [MEMEDev startDataReport];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)memeRealTimeModeDataReceived:(MEMERealTimeData *)data {
    [dataArray removeAllObjects];
    [dataTitleArray removeAllObjects];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.eyeMoveUp]];
    [dataTitleArray addObject:@"eyeMoveUp"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.eyeMoveDown]];
    [dataTitleArray addObject:@"eyeMoveDown"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.eyeMoveLeft]];
    [dataTitleArray addObject:@"eyeMoveLeft"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.eyeMoveRight]];
    [dataTitleArray addObject:@"eyeMoveRight"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.blinkSpeed]];
    [dataTitleArray addObject:@"blinkSpeed"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.blinkStrength]];
    [dataTitleArray addObject:@"blinkStrength"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.isWalking]];
    [dataTitleArray addObject:@"isWalking"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.fitError]];
    [dataTitleArray addObject:@"fitError"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.powerLeft]];
    [dataTitleArray addObject:@"powerLeft"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.accX]];
    [dataTitleArray addObject:@"accX"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.accY]];
    [dataTitleArray addObject:@"accY"];
    
    [dataArray addObject:[[NSNumber alloc] initWithInt:data.accZ]];
    [dataTitleArray addObject:@"accZ"];
    
    [dataArray addObject:[[NSNumber alloc] initWithFloat:data.roll]];
    [dataTitleArray addObject:@"roll"];
    
    [dataArray addObject:[[NSNumber alloc] initWithFloat:data.pitch]];
    [dataTitleArray addObject:@"pitch"];
    
    [dataArray addObject:[[NSNumber alloc] initWithFloat:data.yaw]];
    [dataTitleArray addObject:@"yaw"];
    
    
    [dataTableView reloadData];
}

//*******************v******************************
// table
//**************************************************

// セクション
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// セクション高さ
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
// ロウ
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}
// ロウ高さ
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
// ロウ表示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    }
    
    cell.textLabel.text = [dataTitleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%g",[[dataArray objectAtIndex:indexPath.row] floatValue]];
    
    return cell;
}
// タップ
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
