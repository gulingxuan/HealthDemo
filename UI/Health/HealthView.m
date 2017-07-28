//
//  HealthView.m
//  BaseDemo
//
//  Created by 文艺复兴 on 2017/7/28.
//  Copyright © 2017年 glx. All rights reserved.
//

#import "HealthView.h"

@interface HealthView()

@property (nonatomic, copy) NSString *btnString;

@end

@implementation HealthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLabel];
        [self createBtn];
    }
    return self;
}

-(RACSubject *)runSubject
{
    if (!_runSubject)
    {
        _runSubject = [RACSubject subject];
    }
    return _runSubject;
}

-(void)createLabel
{
    NSArray *titleArr = @[@"运动步数：",@"运动距离：",@"今日步数：",@"今日距离："];
    UILabel *preLabel;
    for (int i = 0; i < 8; i++)
    {
        UILabel *label = [CDUIKit labelWithTextColor:RGBCOLOR(50, 50, 50) numberOfLines:1 text:!(i%2)?titleArr[i/2]:@"" fontSize:16];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(!(i%2)?15:SCW/2 + 15, preLabel?preLabel.bottom + 15:40, SCW/2 - 30, 25);
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
    
    //调整行间距
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
    btn.frame = CGRectMake(50, SCH - 170, SCW - 100, 40);
    ViewBorderRadius(btn, 4, 0, CDclearColor);
    [self addSubview:btn];
    
    @Weak(self)
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @Strong(self)
        BOOL start = ![btn.titleLabel.text isEqualToString:@"开始运动"];
        [self.runSubject sendNext:@(start)];
        [btn setTitle:[btn.titleLabel.text isEqualToString:@"开始运动"]?@"运动中，点击结束……":@"开始运动" forState:UIControlStateNormal];
    }];
}



@end
