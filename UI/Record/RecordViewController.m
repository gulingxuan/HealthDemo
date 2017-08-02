//
//  RecordViewController.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "RecordViewController.h"
#import "GFCalendar.h"

@interface RecordViewController ()<MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate>


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
    [self.view addSubview:self.offlineBtn];
    [self.view addSubview:self.onlineBtn];
    [self.view addSubview:self.setingBtn];
    [self.view addSubview:self.textLabel];
   
    
    
    
    [self.onlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.calendar.mas_bottom).offset(30);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.offlineBtn.mas_left).offset(-10);
        make.height.mas_offset(35);
    }];
    
    [self.offlineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(self.onlineBtn);
        make.right.mas_equalTo(self.setingBtn.mas_left).offset(-10);
        make.width.mas_equalTo(self.onlineBtn);
        make.height.mas_equalTo(self.onlineBtn);
    }];
    
    
    [self .setingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.onlineBtn);
        make.right.mas_equalTo(self.view).offset(-10);
        make.width.mas_equalTo(self.onlineBtn);
         make.height.mas_equalTo(self.onlineBtn);
        
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.onlineBtn.mas_bottom).offset(20);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.bottom.mas_equalTo(self.view).offset(-64);
        
    }];
    
    
}

#pragma mark ---- btn点击事件



-(void)onlineBtnClick{
    
    NSLog(@"大姨妈来了");
    
}

-(void)offlineBtnClick{
    NSLog(@"大姨妈走了");
}


-(void)settingBtnClick{
    
    NSLog(@"设置时间周期");

}


-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
    UILabel *label=(UILabel*)recognizer.view;
    
    NSLog(@"%@被点击了",label.text);
    
    
   
    
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"确认给室友发送消息让她去买？？？" preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击取消");
        
    }]];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击确认");
        [self sendMessage];
    }]];
    
     [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)sendMessage{
    
    
    
    
    //用于判断是否有发送短信的功能（模拟器上就没有短信功能）
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    //判断是否有短信功能
    if (messageClass != nil) {
        
        //有发送功能要做的事情
        
        
        //        有短信功能
        if ([messageClass canSendText]) {
            //发送短信
            
            //实例化MFMessageComposeViewController,并设置委托
            MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
            messageController.messageComposeDelegate = self;
            
            
            //拼接并设置短信内容
            NSString *messageContent = [NSString stringWithFormat:@"家里东西没啦！！！快去买~~~"];
            messageController.body = messageContent;
            
            //设置发送给谁
            messageController.recipients = @[@"15927340323"];
            
            //推到发送试图控制器
            [self presentViewController:messageController animated:YES completion:^{
                
            }];
            
      
            
            
            
            
        }else{

            
            SHOW_AlERTController(nil, @"该设备没有发送短信功能");
            
        }
        
        
        
    }else{

            SHOW_AlERTController(nil, @"iOS版本过低（iOS4.0以后）");
        
    }
    
    
    
    
    
    
   
    
    
}


//发送短信后回调的方法
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
 {
     [self dismissViewControllerAnimated:YES completion:nil];
         NSString *tipContent;
         switch (result) {
             case MessageComposeResultCancelled:
                    tipContent = @"发送短信已取消";
                 break;
     
             case MessageComposeResultFailed:
              tipContent = @"发送短信失败";
                   break;

             case MessageComposeResultSent:
                 tipContent = @"发送成功";
              break;
    
             default:
              break;
    }


     
     SHOW_AlERTController(nil,tipContent );
     
     
 }




#pragma mark ---- 懒加载

-(UIButton *)onlineBtn
{
    
    if (!_onlineBtn) {
        
        _onlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_onlineBtn setTitle:@"大姨妈来啦" fontSize:13 titleColor:nil selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_onlineBtn addTarget:self action:@selector(onlineBtnClick) forControlEvents:UIControlEventTouchUpInside];
        ViewBorderRadius(_onlineBtn, 5, 0, [UIColor clearColor]);

    }
    return _onlineBtn;
}

-(UIButton *)offlineBtn
{
    
    if (!_offlineBtn) {
        
        _offlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_offlineBtn setTitle:@"大姨妈走啦" fontSize:13 titleColor:nil selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_offlineBtn addTarget:self action:@selector(offlineBtnClick) forControlEvents:UIControlEventTouchUpInside];
        ViewBorderRadius(_offlineBtn, 5, 0, [UIColor clearColor]);

    }
    return _offlineBtn;
}

-(UIButton *)setingBtn
{
    
    if (!_setingBtn) {
        
        _setingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_setingBtn setTitle:@"设置周期" fontSize:13 titleColor:nil selectTitleColor:nil backgroundColor:RGBCOLOR(179, 219, 158) image:nil];
        [_setingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        ViewBorderRadius(_setingBtn,5, 0, [UIColor clearColor]);

    }
    return _setingBtn;
}

-(UILabel *)textLabel
{
    
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.numberOfLines = 0;
        _textLabel.textColor =RGBCOLOR(179, 219, 158);
        _textLabel.font = [UIFont systemFontOfSize:12];
        _textLabel.textAlignment  =1;
        _textLabel.text = @"距离你来大姨妈还有10天\n玫瑰红糖在茶几上，姨妈巾在更衣间的第二个抽屉里，如果没有了就点击下我~";
        _textLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
        
        [_textLabel addGestureRecognizer:labelTapGestureRecognizer];
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
