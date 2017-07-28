//
//  UINavigationBar+ChangeColor.m
//  WYFX_Demo
//
//  Created by 顾泠轩 on 16/12/26.
//  Copyright © 2016年 ChenDan. All rights reserved.
//

#import "UINavigationBar+ChangeColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (ChangeColor)

static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//改变导航栏颜色
-(void)cd_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
        [self setBackgroundImage:[self getImageFromView:self.overlay] forBarMetrics:UIBarMetricsDefault];
    }
}
//改变导航栏渐变色 - 横向
-(void)cd_setChangeBackgroundColor:(NSArray *)colorArr
{
    if (!self.overlay)
    {
        
        
        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.overlay.bounds;
        gradient.colors = colorArr; //
        gradient.startPoint = CGPointMake(0, 1);
        gradient.endPoint = CGPointMake(1, 1);
        [self.overlay.layer insertSublayer:gradient atIndex:0];
        
        [self setBackgroundImage:[self getImageFromView:self.overlay] forBarMetrics:UIBarMetricsDefault];
        //[self insertSubview:self.overlay atIndex:0];
    }
    
    
}

//改变导航栏渐变色 - 纵向
-(void)cd_setVerticalChangeBackgroundColor:(NSArray *)colorArr
{
    if (!self.overlay)
    {
        
        
        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.overlay.bounds;
        gradient.colors = colorArr; //
        gradient.startPoint = CGPointMake(1, 0);
        gradient.endPoint = CGPointMake(1, 1);
        [self.overlay.layer insertSublayer:gradient atIndex:0];
        
        [self setBackgroundImage:[self getImageFromView:self.overlay] forBarMetrics:UIBarMetricsDefault];
        //[self insertSubview:self.overlay atIndex:0];
    }
    
    
}

-(UIImage *)getImageFromView:(UIView *)theView
{
    //UIGraphicsBeginImageContext(theView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, YES, theView.layer.contentsScale);
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
