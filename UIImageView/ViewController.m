//
//  ViewController.m
//  ImageView
//
//  Created by WeiChaoW on 16/9/20.
//  Copyright © 2016年 WeiChaoW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建imageView
    UIImageView *imageView = [[UIImageView alloc] init];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"] highlightedImage:[UIImage imageNamed:@"icon_highlighted.png"]];
    
    //设置尺寸
    imageView.frame = CGRectMake(0, 64, 100, 100);
    //添加图片
    imageView.image = [UIImage imageNamed:@"icon.png"];
    //设置高亮状态时的ImageView
    imageView.highlightedImage = [UIImage imageNamed:@"icon10.png"];
    //设置高亮状态
    imageView.highlighted = YES;
    //设置用户交互状态
    imageView.userInteractionEnabled = YES;
    //添加imageView
    [self.view addSubview:imageView];
    //向左向上拉伸图片,拉伸的距离相当于图片最顶端和最左边向里多少距离的位置向上向左拉伸
    //    imageView.image=[[UIImage imageNamed:@"logo_title"]stretchableImageWithLeftCapWidth:4 topCapHeight:4];
    
    
    //创建一个可变的数组，添加18张图片
    NSMutableArray *imageArr = [NSMutableArray array];
    for (int i = 1; i <= 18; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %d",i]];
        [imageArr addObject:image];
    }
    
    //创建iv
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(40, 60, 60, 60)];
    
    //实现简单的动画效果
    //动画图片的来源
    iv.animationImages = imageArr;
    //设置一轮动画的持续时间为2s
    iv.animationDuration = 2;
    //设置动画循环次数0表示一直循环
    iv.animationRepeatCount = 0;
    //开始播放动画
    [iv startAnimating];
    //判断是否正在播放动画
//    BOOL isORNo = [iv isAnimating];
    //停止播放动画
    //    [iv stopAnimating];
    //设置iv的tag值
    iv.tag = 10;
    //添加iv
    [self.view addSubview:iv];
    
    /*
     添加一个定时器
     Interval:一个周期
     target:谁来定时
     selector:定时器触发的方法
     userInfo:参数
     repeats:是否重复
     */
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(statAnimation) userInfo:nil repeats:YES];
    
}

//开始动画
- (void)statAnimation
{
    //找到上面创建的iv
    UIView *iv = [self.view viewWithTag:10];
    
    //随机改变iv的最标
    int x = arc4random_uniform(300)+5;
    int y = arc4random_uniform(300)+10;
    int w = arc4random_uniform(60)+5;
    int h = arc4random_uniform(60)+10;
    
    //动画，周期为2s，改变iv的位置
    [UIView animateWithDuration:2 animations:^{
        iv.frame = CGRectMake(x, y, w, h);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
