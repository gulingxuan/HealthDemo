//
//  UtilHeader.h
//  
//
//  Created by 顾泠轩 on 16/12/20.
//
//

/*
 
 tag : 1602
 
 
 */

#ifndef UtilHeader_h
#define UtilHeader_h


#endif /* UtilHeader_h */


// 测试及正式环境切换 0：测试  1：正式
#define TestMode 0

#define changeColorArr [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:15/255.0 green:110/255.0 blue:219/255.0 alpha:1] CGColor],(id)[[UIColor colorWithRed:128/255.0 green:207/255.0 blue:255/255.0 alpha:1]CGColor],  nil]

#define Weak(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define Strong(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

// ********** 颜色 ***********
//主色调:深蓝
#define JPMAINCOLOR [UIColor mainBGColor]
//浅蓝
#define JPBLUECOLOR [UIColor jpBlueColor]
//字体黑色
#define JPFONTCOLOR [UIColor jpBlackFontColor]
#define JPColor(color) [UIColor colorWithHex:(color)]

//屏幕宽高
#define SCW [[UIScreen mainScreen] bounds].size.width
#define SCH [[UIScreen mainScreen] bounds].size.height

//弱引用 weakself
#define WeakSelf __weak typeof(self) weakSelf = self;
//强引用
#define StrongSelf __strong typeof(self) strongSelf = weakSelf;

// View 坐标(x,y)和宽高(width,height)
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//当前APP版本
#define CurrentVersion [[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey] substringToIndex:([[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey] length]-5)]

//设备信息
#define DeviceModel  [UIDevice currentDevice].model

//系统信息
#define SystemVersion [UIDevice currentDevice].systemVersion

//获取通知中心
#define CCNotificationCenter [NSNotificationCenter defaultCenter]
//获取随机颜色
#define CCRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

// clear背景颜色
#define CDclearColor [UIColor clearColor]

/**
 *  the saving objects      存储对象
 *
 *  @param __VALUE__ V
 *  @param __KEY__   K
 *
 *  @return
 */
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  get the saved objects       获得存储的对象
 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

//获取图片资源
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//GCD - 一次性执行
#define CCDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define CCDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define CCDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

//GCD - 延时线程
#define CCDISPATCH_AFTER_QUEUE(time,afterQueueBlock)     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), afterQueueBlock);

//系统版本判断
#define iOS9_LATER (([[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0) ? YES : NO)
#define iOS8_LATER (([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0) ? YES : NO)
#define iOS7_LATER (([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0) ? YES : NO)
#define iOS6_LATER (([[[UIDevice currentDevice]systemVersion] floatValue] >= 6.0) ? YES : NO)

//判断iphone4/4s
#define iPhone4_4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone5/5s
#define iPhone5_5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iphone6+
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


















