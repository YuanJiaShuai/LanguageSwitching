//
//  LanguageStyleViewController.m
//  LanguageSwitching
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 YJS. All rights reserved.
//

#import "LanguageStyleViewController.h"
#import "HXLanguageManager.h"
#import <Masonry.h>

@interface LanguageStyleViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * showTab;

@end

@implementation LanguageStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setupShowTab];
}

/**初始化界面*/
- (void)setupShowTab{
    _showTab = [UITableView new];
    _showTab.delegate = self;
    _showTab.dataSource = self;
    _showTab.tableFooterView = [UIView new];
    [self.view addSubview:_showTab];
    [_showTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.right.equalTo(@(-5));
        make.top.equalTo(@5);
        make.bottom.equalTo(@(-5));
    }];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identfire = @"identfire";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identfire];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfire];
    }
    if(indexPath.row == 0){
        cell.textLabel.text = @"中文";
    }
    if(indexPath.row == 1){
        cell.textLabel.text = @"Englist";
    }
    if(indexPath.row == 2){
        cell.textLabel.text = @"Français";
    }
    if(indexPath.row == 3){
        cell.textLabel.text = @"عربي";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //中文
    if(indexPath.row == 0){
        [kLanguageManager setUserlanguage:@"zh-Hans-CN"];
    }
    //英文
    if(indexPath.row == 1){
        [kLanguageManager setUserlanguage:@"en-CN"];
    }
    //法语
    if(indexPath.row == 2){
        [kLanguageManager setUserlanguage:@"fr"];
    
    }
    //阿拉伯语
    if(indexPath.row == 3){
        [kLanguageManager setUserlanguage:@"ar"];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

////取消按钮
//- (void)cancleButtonAction:(UIButton *)button {
//    [self.view endEditing:YES];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//}

@end
