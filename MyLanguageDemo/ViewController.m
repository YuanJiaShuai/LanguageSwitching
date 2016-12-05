//
//  ViewController.m
//  MyLanguageDemo
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 YJS. All rights reserved.
//

#import "ViewController.h"
#import "LanguageStyleViewController.h"
#import "HXLanguageManager.h"
#import <Masonry.h>

@interface ViewController ()

@property (strong, nonatomic) UIBarButtonItem * rightBtn;
@property (strong, nonatomic) UILabel * messageLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    //注册通知，用于接收改变语言的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:ChangeLanguageNotificationName object:nil];
    [self setupView];
}

- (void)changeLanguage{
    _messageLab.text = kLocalizedString(@"Message",@"1.iOS首先搜索用户的语言偏好设置(设置-通用-语言与地区)\n2.检测你的应用是否支持用户的语言，先用偏好设置的第一个语言，检测应用是否包含该语言对应的文件夹(后缀是.lproj，文件名部分，英语为en，中文简体为zh-Hans，日语为ja)如果存在，那就是该语言，否则用偏好设置第二个语言来匹配。重复该过程。\n3.一旦系统为应用确定了语言，对应的.lproj文件夹就会用作本地化资源。");
    
    _rightBtn.title = kLocalizedString(@"Setting",@"设置");
}

- (void)setupView{
    _rightBtn = [[UIBarButtonItem alloc]initWithTitle:kLocalizedString(@"Setting",@"设置") style:UIBarButtonItemStylePlain target:self action:@selector(selectLanguage)];
    self.navigationItem.rightBarButtonItem = _rightBtn;
    
    _messageLab = [UILabel new];
    _messageLab.numberOfLines = 0;
    _messageLab.text = kLocalizedString(@"Message",@"1.iOS首先搜索用户的语言偏好设置(设置-通用-语言与地区)\n2.检测你的应用是否支持用户的语言，先用偏好设置的第一个语言，检测应用是否包含该语言对应的文件夹(后缀是.lproj，文件名部分，英语为en，中文简体为zh-Hans，日语为ja)如果存在，那就是该语言，否则用偏好设置第二个语言来匹配。重复该过程。\n3.一旦系统为应用确定了语言，对应的.lproj文件夹就会用作本地化资源。");
    [self.view addSubview:_messageLab];
    [_messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.top.equalTo(@5);
        make.right.equalTo(@(-5));
        make.bottom.equalTo(@(-5));
    }];
}

- (void)selectLanguage{
    LanguageStyleViewController * languageStyle = [[LanguageStyleViewController alloc]init];
    [self.navigationController pushViewController:languageStyle animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
