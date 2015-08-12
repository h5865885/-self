//
//  WHView.m
//  折线图
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 hao. All rights reserved.
//

#import "WHView.h"

@interface WHView ()


@end

@implementation WHView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSArray * arrTime = @[@"16",@"14",@"12",@"10",@"8",@"6",@"4",@"2"];
        for (int i = 0; i < arrTime.count; i++) {
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10,200/8 * i+26, 15, 12)];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = arrTime[i];
            label.font = [UIFont systemFontOfSize:12.0f];
            [self addSubview:label];
        }
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12.0f];
        label.text = @"/小时";
        [self addSubview:label];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect{
    NSLog(@"2");
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    //    添加路径
    CGPathMoveToPoint(path, nil, width-2, 0);
    CGPathAddLineToPoint(path, nil, width-2, height);
    
    //    [self drawLinearGradient:context];
    //    [self drawRadialGradient:context];
    //    线宽//4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context,0.3, 1, 0.8, 1);
    //设置笔触颜色 填充色
    CGContextSetRGBFillColor(context,0.5, 1.0, 0.5, 1);
    //设置填充色宽度
    CGContextSetLineWidth(context, 3);
    //    颜色
    CGColorRef color = [UIColor yellowColor].CGColor;
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0.8, color);
    
    //    CGContextDrawPath(context, kCGPathFillStroke);
    
    //    添加到上下文
    CGContextAddPath(context, path);
    //    渲染放到最后...添加完了才渲染
    //    渲染
    CGContextStrokePath(context);
    
}

@end
