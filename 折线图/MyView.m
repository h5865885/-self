//
//  MyView.m
//  折线图
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 hao. All rights reserved.
//

#import "MyView.h"
#import "WHPoint.h"
#import <QuartzCore/QuartzCore.h>
@interface MyView ()

@property (nonatomic , assign) NSInteger xTemp;
@property (nonatomic , assign) NSInteger yTemp;
@property (nonatomic, assign) CGPoint contentScroll;
@property (nonatomic , copy) NSMutableArray * arrPoint;
@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        NSLog(@"1");
        _arrPoint = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addPoint:(WHPoint *)newPoint{
//    传入数据
    if (newPoint != nil) {
        [_arrPoint addObject:newPoint];
    }
    NSLog(@"addPoint");
//    [self layoutIfNeeded];
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect{
    NSLog(@"2");
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    //    添加路径
    CGPathMoveToPoint(path, nil, 1,  height-2);
    CGPathAddLineToPoint(path, nil, width * 2, height-1);
    
    //    [self drawLinearGradient:context];
    //    [self drawRadialGradient:context];
    //    线宽//4.设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context,0.3, 1, 0.8, 1);
    //设置笔触颜色 填充色
//    CGContextSetRGBFillColor(context,0.5, 1.0, 0.5, 1);
    //设置填充色宽度
    CGContextSetLineWidth(context, 3);
//    //    颜色
//    CGColorRef color = [UIColor yellowColor].CGColor;
//    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0.8, color);
    
    //    CGContextDrawPath(context, kCGPathFillStroke);
    
    //    添加到上下文
    CGContextAddPath(context, path);
    //    渲染放到最后...添加完了才渲染
    //    渲染
    CGContextStrokePath(context);
    
    
    
    
    [self drawY_Line];
    [self drawX_Line];
    [self drawLine];

}

- (void)drawLine{
    int height = self.bounds.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGMutablePathRef path = CGPathCreateMutable();
//    平移坐标系统 把系统默认的 (0,0)点移动 到 (0,height)
    CGContextTranslateCTM(context, 0.0f , height);
//    缩放坐标系统  y值相当于 乘于 -1;
    CGContextScaleCTM(context, 1, -1);
    
//    调用传入的数据
    if (_arrPoint.count != 0) {
        
        for (int num = 0; num < _arrPoint.count; num++) {
            WHPoint * point = _arrPoint[num];
            NSArray * arr = point.arrPoint;
//            [point.lineColor set];
            CGContextSetStrokeColorWithColor(context, point.lineColor.CGColor);
            //设置填充色宽度 线宽
            CGContextSetLineWidth(context, 2.0f);
            for (int i = 0 ; i < arr.count; i=i+2) {
                
                if (i == 0) {
                    NSInteger x = [arr[i] integerValue];
                    NSInteger y = [arr[i+1] integerValue];
                    
//                    CGContextMoveToPoint(context, nil, 0, 0);
                    CGContextMoveToPoint(context, 0.0, 0.0);
                    CGContextAddLineToPoint(context, x , y);
                    
                    _xTemp = x;
                    _yTemp = y;
                }else {
                    NSInteger x = [arr[i] integerValue];
                    NSInteger y = [arr[i+1] integerValue];

                    CGContextMoveToPoint(context, _xTemp, _yTemp);
                    CGContextAddLineToPoint(context, x , y);
                    _xTemp = x;
                    _yTemp = y;
                }

            }
            NSLog(@"%@",point.lineColor); 
            //    渲染放到最后...添加完了才渲染
            CGContextStrokePath(context);
        }
    }

//   阴影 颜色
//    CGColorRef color = [UIColor colorWithRed:0.128 green:1.000 blue:0.842 alpha:1.000].CGColor;
////    阴影
//    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 1, color);
    

}

- (void)drawY_Line{
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    for (int i = 1; i < 8; i++) {
        CGPathMoveToPoint(path, nil, 0, height/8 * i);
        CGPathAddLineToPoint(path, nil, width , height/8 * i);
    }
    [UIColor colorWithRed:0.238 green:0.241 blue:0.241 alpha:1.000];
    //设置线颜色
    CGContextSetRGBStrokeColor(context,0.0, 0.0, 0.0, 0.5);
    
    //设置填充色宽度 线宽
    CGContextSetLineWidth(context, 0.4f);
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

- (void)drawX_Line{
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    for (int i = 1; i < 8; i++) {
        CGPathMoveToPoint(path, nil, width / 8 * i, 0);
        CGPathAddLineToPoint(path, nil, width / 8 * i , height);
    }
    [UIColor colorWithRed:0.238 green:0.241 blue:0.241 alpha:1.000];
    //设置线颜色
    CGContextSetRGBStrokeColor(context,0.0, 0.0, 0.0, 0.5);
    
    //设置填充色宽度 线宽
    CGContextSetLineWidth(context, 0.4f);
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
