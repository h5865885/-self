//
//  ViewController.m
//  折线图
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 hao. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "WHScrollView.h"
#import "WHView.h"
#import "WHPoint.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.874 green:1.000 blue:0.000 alpha:1.000];
    
    NSArray * arr = @[@"8.1",@"8.2",@"8.3",@"8.4",@"8.5",@"8.6",@"8.7",@"8.8",@"8.9",@"8.10"];
    
    WHScrollView * scrollView = [[WHScrollView alloc]initWithFrame:CGRectMake(40, 100, 280, 220) andYvalues:arr];
    scrollView.backgroundColor =  [UIColor colorWithRed:1.000 green:0.981 blue:0.729 alpha:1.000];
    [self.view addSubview:scrollView];
    
    NSArray * arrPoint = @[@50, @40,@(50*2), @150,@(50*3), @110,@(50*4), @120,@(50*5), @160,@(50*6), @160,@(50*7), @110];
    
    NSArray * arrPoint2 = @[@0, @50,@(50*2), @120,@(50*3), @10,@(50*4), @130,@(50*5), @120,@(50*6), @110,@(50*7), @190];
    
    WHPoint * myPoint = [[WHPoint alloc]init];
    //    传入CGPoint
    myPoint.arrPoint = arrPoint;
    myPoint.lineColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.383 alpha:1.000];
    
//        myPoint.lineWidth = 1;
    
    WHPoint * myPoint2 = [[WHPoint alloc]init];
    myPoint2.arrPoint = arrPoint2;
    myPoint2.lineColor = [UIColor colorWithRed:0.7389 green:0.5979 blue:0.9893 alpha:1.0];
    
    [[[scrollView subviews] firstObject] addPoint:myPoint];
    [[[scrollView subviews] firstObject] addPoint:myPoint2];
    
    
    WHView * viewLine = [[WHView alloc]initWithFrame:CGRectMake(10, 70, 30, 230)];
    viewLine.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewLine];
    
    
//    重新绘制view
//    [view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
