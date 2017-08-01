//
//  RecordViewController.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "RecordViewController.h"
#import "GFCalendar.h"

@interface RecordViewController ()


@property (nonatomic,strong)GFCalendarView *calendar;
@property (nonatomic,strong)UIButton *onlineBtn;
@property (nonatomic,strong)UIButton *offlineBtn;
@property (nonatomic,strong)UIButton *setingBtn;
@property (nonatomic,strong)UILabel *textLabel;



@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"姨妈记录";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:179/255.0 green:219/255.0 blue:158/255.0 alpha:0.5]];
    [self creatUI];
    
    
}



-(void)creatUI{
    
    [self.view addSubview:self.calendar];
//    [self.view addSubview:self.offlineBtn];
//    [self.view addSubview:self.onlineBtn];
//    [self.view addSubview:self.setingBtn];
//    [self.view addSubview:self.textLabel];
   
    
    
    
    [self.calendar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(10);
        make.width.mas_offset(self.view.frame.size.width-20);
        
        
    }];
    
//    
//    [self.onlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.mas_equalTo(self.calendar).offset(10);
//        make.left.mas_equalTo(self.view).offset(10);
//        make.right.mas_equalTo(self.offlineBtn).offset(-10);
//        make.bottom.mas_equalTo(self.textLabel).offset(-10);
//        
//    }];
//    
//    [self.offlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerY.mas_equalTo(self.onlineBtn);
//        make.right.mas_equalTo(self.setingBtn).offset(-10);
//        make.width.mas_equalTo(self.onlineBtn);
//        
//    }];
//    
//    
//    [self .setingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.centerY.mas_equalTo(self.onlineBtn);
//        make.right.mas_equalTo(self.view).offset(-10);
//        make.width.mas_equalTo(self.onlineBtn);
//        
//    }];
//    
//    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.left.mas_equalTo(self.view).offset(10);
//        make.right.mas_equalTo(self.view).offset(10);
//        make.bottom.mas_equalTo(self.view).offset(10);
//        
//    }];
//    
    
}

#pragma mark ---- btn点击事件



-(void)onlineBtnClick{
    
    
}

-(void)offlineBtnClick{
    
}


-(void)settingBtnClick{
    
    
    
    
    
}


#pragma mark ---- 懒加载

-(UIButton *)onlineBtn
{
    
    if (!_onlineBtn) {
        
        _onlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_onlineBtn setTitle:@"大姨妈来啦" fontSize:13 titleColor:RGBCOLOR(0, 0, 0) selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_onlineBtn addTarget:self action:@selector(onlineBtnClick) forControlEvents:UIControlEventTouchUpInside];

    }
    return _onlineBtn;
}

-(UIButton *)offlineBtn
{
    
    if (!_offlineBtn) {
        
        _offlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_offlineBtn setTitle:@"大姨妈走啦" fontSize:13 titleColor:nil selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_offlineBtn addTarget:self action:@selector(offlineBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _offlineBtn;
}

-(UIButton *)setingBtn
{
    
    if (!_setingBtn) {
        
        _setingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setingBtn setTitle:@"大姨妈来啦" fontSize:13 titleColor:nil selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_setingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _setingBtn;
}

-(UILabel *)textLabel
{
    
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        
    }
    
    return _textLabel;
    
}

-(GFCalendarView *)calendar{
    if (!_calendar) {
        
        CGFloat width = self.view.bounds.size.width - 20.0;
        CGPoint origin = CGPointMake(10.0, 64.0 + 10.0);
        _calendar = [[GFCalendarView alloc] initWithFrameOrigin:origin width:width];
        _calendar.calendarBasicColor = RGBCOLOR(179, 219, 158); // 更改颜色
        
    }
    
    return _calendar;
    
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
