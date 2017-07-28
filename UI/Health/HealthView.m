//
//  HealthView.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HealthView.h"

@interface HealthView()
@property (nonatomic, strong) UILabel *curSetupLabel;//当前步数
@property (nonatomic, strong) UILabel *curDistanceLabel;//当前公里数
@property (nonatomic, strong) UILabel *resultSetupLabel;//步数结果
@property (nonatomic, strong) UILabel *resultDistanceLabel;//距离结果
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, copy) NSString *setupNumber;//步数
@property (nonatomic, copy) NSString *distanceNumber;//距离
@property (nonatomic, copy) NSString *btnString;

@end

@implementation HealthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
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
        [self addSubview:label];
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
    [self addSubview:messageLabel];
    
    
    
}

-(void)createBtn
{
    UIButton *btn = [CDUIKit buttonWithBackgroundColor:RGBCOLOR(179, 219, 158) titleColor:[UIColor whiteColor] titleHighlightColor:nil title:self.btnString?self.btnString:@"开始运动" fontSize:16];
    btn.frame = CGRectMake(50, SCH - 120, SCW - 100, 40);
    ViewBorderRadius(btn, 4, 0, CDclearColor);
    [self addSubview:btn];
    
    @Weak(self)
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @Strong(self)
        
    }];
}



@end
