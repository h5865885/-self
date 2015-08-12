//
//  WHPoint.h
//  折线图
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 hao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WHPoint : NSObject

@property (nonatomic , copy) NSArray * arrPoint;
@property (nonatomic, strong) UIColor* lineColor;
@property (nonatomic, assign) float lineWidth;

@end
