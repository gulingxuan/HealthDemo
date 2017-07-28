//
//  HealthViewController.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/26.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HealthViewController.h"
#import "HealthKitManage.h"
#import <UShareUI/UShareUI.h>

@interface HealthViewController ()


@property (nonatomic, strong) UILabel *curSetupLabel;//当前步数
@property (nonatomic, strong) UILabel *curDistanceLabel;//当前公里数
@property (nonatomic, strong) UILabel *resultSetupLabel;//步数结果
@property (nonatomic, strong) UILabel *resultDistanceLabel;//距离结果
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, copy) NSString *setupNumber;//步数
@property (nonatomic, copy) NSString *distanceNumber;//距离
@property (nonatomic, copy) NSString *btnString;

@end

@implementation HealthViewController

@synthesize setupNumber = _setupNumber;
@synthesize distanceNumber = _distanceNumber;
@synthesize startDate = _startDate;
@synthesize btnString = _btnString;

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:SPORT_DATA_REFRESH object:nil];
    //self.title = @"运动";
}

-(void)viewWillAppear:(BOOL)animated
{
    [self refreshData];
    
}

//点右键截图
-(void)rightAction
{
    //[self savePhoto];
    //分享
    [self share];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -- set / get
-(NSString *)setupNumber
{
    if (!_setupNumber)
    {
        _setupNumber = UserDefaultObjectForKey(@"setupNumber");
    }
    return _setupNumber;
}

-(void)setSetupNumber:(NSString *)setupNumber
{
    _setupNumber = setupNumber;
    UserDefaultSetObjectForKey(_setupNumber, @"setupNumber");
}

-(NSString *)distanceNumber
{
    if (!_distanceNumber)
    {
        _distanceNumber = UserDefaultObjectForKey(@"distanceNumber");
    }
    return _distanceNumber;
}

-(void)setDistanceNumber:(NSString *)distanceNumber
{
    _distanceNumber = distanceNumber;
    UserDefaultSetObjectForKey(_distanceNumber, @"distanceNumber");
}

-(NSString *)startDate
{
    if (!_startDate)
    {
        _startDate = UserDefaultObjectForKey(@"startDate");
    }
    return _startDate;
}

-(void)setStartDate:(NSString *)startDate
{
    _startDate = startDate;
    UserDefaultSetObjectForKey(_startDate, @"startDate");
}

-(NSString *)btnString
{
    if (!_btnString)
    {
        _btnString = UserDefaultObjectForKey(@"btnString");
    }
    return _btnString;
}

-(void)setBtnString:(NSString *)btnString
{
    _btnString = btnString;
    UserDefaultSetObjectForKey(_btnString, @"btnString");
}

#pragma mark -- 数据加载




#pragma mark -- UI
-(void)createUI
{
    //导航栏颜色
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:179/255.0 green:219/255.0 blue:158/255.0 alpha:0.5]];
    //标题
    UILabel *titleLabel = [CDUIKit labelWithBackgroundColor:CDclearColor textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter numberOfLines:1 text:@"Run" fontSize:18];
    titleLabel.font = [UIFont fontWithName:@"Zapfino" size:18];
    titleLabel.frame = CGRectMake(0, 0, 100, 40);
    self.navigationItem.titleView = titleLabel;
    
    //右键
    [self createNavigationBarRightBarButtonItemWithTitle:@"分享"];
    
    
    [self createLabel];
    [self createBtn];
    
}

-(void)createLabel
{
    NSArray *titleArr = @[@"运动步数：",@"运动距离：",@"今日步数：",@"今日距离："];
    UILabel *preLabel;
    for (int i = 0; i < 8; i++)
    {
        UILabel *label = [CDUIKit labelWithTextColor:RGBCOLOR(50, 50, 50) numberOfLines:1 text:!(i%2)?titleArr[i/2]:@"" fontSize:16];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(!(i%2)?15:SCW/2 + 15, preLabel?preLabel.bottom + 15:110, SCW/2 - 30, 25);
        [self.view addSubview:label];
        if (i%2)
        {
            switch (i/2)
            {
                case 0:
                    self.resultSetupLabel = label;
                    break;
                case 1:
                    self.resultDistanceLabel = label;
                    break;
                case 2:
                    self.curSetupLabel = label;
                    break;
                case 3:
                    self.curDistanceLabel = label;
                    break;
                    
                default:
                    break;
            }
            preLabel = label;
        }
    }
    
    NSString *str = @"一条有梦想的咸鱼，梦想是成为一个灵活的胖子。\r梦想已经实现了一半，是个胖子。\r就差灵活了。";
    
    UILabel *messageLabel = [CDUIKit labelWithBackgroundColor:CDclearColor textColor:RGBCOLOR(50, 50, 50) textAlignment:NSTextAlignmentCenter numberOfLines:0 text:@"" fontSize:15];
    messageLabel.frame = CGRectMake(20, preLabel.bottom + 40, SCW - 40, 120);
    //跳转行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    messageLabel.attributedText = attributedString;
    [self.view addSubview:messageLabel];
    
    
    
}

-(void)createBtn
{
    UIButton *btn = [CDUIKit buttonWithBackgroundColor:RGBCOLOR(179, 219, 158) titleColor:[UIColor whiteColor] titleHighlightColor:nil title:self.btnString?self.btnString:@"开始运动" fontSize:16];
    btn.frame = CGRectMake(50, SCH - 120, SCW - 100, 40);
    ViewBorderRadius(btn, 4, 0, CDclearColor);
    [self.view addSubview:btn];
    
    @Weak(self)
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @Strong(self)
        
        if ([btn.titleLabel.text isEqualToString:@"运动中，点击结束……"])
        {
            self.setupNumber = nil;
            self.distanceNumber = nil;
        }
        else
        {
            self.startDate = [self getCurDate];
            HealthKitManage *manage = [HealthKitManage shareInstance];
            //步数
            [manage authorizeHealthKit:^(BOOL success, NSError *error) {
                
                if (success) {
                    NSLog(@"success");
                    [manage getStepCount:^(double value, NSError *error) {
                        NSLog(@"1count-->%.0f", value);
                        NSLog(@"1error-->%@", error.localizedDescription);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.curSetupLabel.text = [NSString stringWithFormat:@"%.0f步", value];
                            self.resultSetupLabel.text = @"0";
                            self.setupNumber = [NSString stringWithFormat:@"%.0f", value];
                        });
                        
                    }];
                }
                else {
                    NSLog(@"fail");
                }
            }];
            
            //距离
            [manage authorizeHealthKit:^(BOOL success, NSError *error) {
                
                if (success) {
                    NSLog(@"success");
                    [manage getDistance:^(double value, NSError *error) {
                        NSLog(@"2count-->%.2f", value);
                        NSLog(@"2error-->%@", error.localizedDescription);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            self.curDistanceLabel.text = [NSString stringWithFormat:@"%.2f公里", value];
                            self.resultDistanceLabel.text = @"0";
                            self.distanceNumber = [NSString stringWithFormat:@"%.2f", value];
                        });
                        
                    }];
                }
                else {
                    NSLog(@"fail");
                }
            }];
        }
        
        [btn setTitle:[btn.titleLabel.text isEqualToString:@"开始运动"]?@"运动中，点击结束……":@"开始运动" forState:UIControlStateNormal];
        self.btnString = btn.titleLabel.text;
    }];
}


#pragma mark -- 点击事件



#pragma mark --逻辑处理
//获取当前时间
-(NSString *)getCurDate
{
    NSDate *date =[NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%ld-%ld",currentYear,currentMonth,currentDay];
    return dateStr;
}

//刷新步数
-(void)refreshData
{
    if (self.startDate)
    {
        NSString *curDate = [self getCurDate];
        if (![self.startDate isEqualToString:curDate])
        {
            self.setupNumber = nil;
            self.distanceNumber = nil;
        }
    }
    else
    {
        self.setupNumber = nil;
        self.distanceNumber = nil;
    }
    
    HealthKitManage *manage = [HealthKitManage shareInstance];
    //刷新步数
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"success");
            [manage getStepCount:^(double value, NSError *error) {
                NSLog(@"1count-->%.0f", value);
                NSLog(@"1error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.curSetupLabel.text = [NSString stringWithFormat:@"%.0f步", value];
                    if(self.setupNumber)
                    {
                        CGFloat startSetup = [self.setupNumber floatValue];
                        self.resultSetupLabel.text = value>startSetup?[NSString stringWithFormat:@"%.0f步",value-startSetup] : @"0步";
                    }
                    else
                    {
                        self.resultSetupLabel.text = @"0步";
                    }
                    
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];

    //刷新距离
    if (self.distanceNumber)
    {
        [manage authorizeHealthKit:^(BOOL success, NSError *error) {
            
            if (success) {
                NSLog(@"success");
                [manage getDistance:^(double value, NSError *error) {
                    NSLog(@"2count-->%.2f", value);
                    NSLog(@"2error-->%@", error.localizedDescription);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.curDistanceLabel.text = [NSString stringWithFormat:@"%.2f公里", value];
                        if (self.distanceNumber)
                        {
                            CGFloat startDistance = [self.distanceNumber floatValue];
                            self.resultDistanceLabel.text = value > startDistance ? [NSString stringWithFormat:@"%.2f公里",value -  startDistance] : @"0公里";
                        }
                        else
                        {
                            self.resultDistanceLabel.text = @"0公里";
                        }
                    });
                }];
            }
            else {
                NSLog(@"fail");
            }
        }];
        
        
    }

}

#pragma mark --截图
-(void)savePhoto

{
    
    UIImage * image = [self captureImageFromView:self.view];
    [self loadImageFinished:image];
    
}

//截图功能

-(UIImage *)captureImageFromView:(UIView *)view

{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
    
}

//保存图片到相册
- (void)loadImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    if (image && !error)
    {
        [self.view makeToast:@"截图成功"];
    }
}

#pragma mark -- 友盟分享
//友盟分享
-(void)share
{
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的确定所选平台进行下一步操作
        
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        //设置文本
        messageObject.text = @"#胖轩日常#";
        //创建图片内容对象
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        shareObject.shareImage = [self captureImageFromView:[UIApplication sharedApplication].keyWindow];
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************分享失败 %@*********",error);
                [self.view makeToast:@"分享失败"];
            }else{
                NSLog(@"response data is %@",data);
            }
        }];
    }];
}


@end
