//
//  HealthViewController.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/26.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HealthViewController.h"
#import <UShareUI/UShareUI.h>
#import "HealthViewModel.h"

@interface HealthViewController ()

@property (nonatomic, strong) HealthViewModel *viewModel;

@end

@implementation HealthViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.viewModel refreshData];
    
}

//点右键分享到微博
-(void)rightAction
{
    [self share];
}



#pragma mark -- set / get

-(HealthViewModel *)viewModel
{
    if (!_viewModel)
    {
        _viewModel = [[HealthViewModel alloc]init];
    }
    return _viewModel;
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
    [self.view addSubview:self.viewModel.healthView];
    [self.viewModel refreshData];
    
}


#pragma mark -- 点击事件



#pragma mark --逻辑处理



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
        shareObject.shareImage = [self.viewModel captureImageFromView:[UIApplication sharedApplication].keyWindow];
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
