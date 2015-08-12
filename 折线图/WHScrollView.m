//
//  WHScrollView.m
//  折线图
//
//  Created by qianfeng on 15/8/12.
//  Copyright (c) 2015年 hao. All rights reserved.
//

#import "WHScrollView.h"
#import "MyView.h"

@interface WHScrollView ()

@end

@implementation WHScrollView

- (instancetype)initWithFrame:(CGRect)frame andYvalues:(NSArray *)count{

    if (self = [super initWithFrame:frame]) {
        
//        默认280
        if (count.count > 7) {
            self.contentSize = CGSizeMake(count.count * 40, self.bounds.size.height-20);
        }
        self.backgroundColor = [UIColor colorWithRed:1.000 green:0.981 blue:0.729 alpha:1.000];
        self.bounces = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        MyView * view = [[MyView alloc]initWithFrame:CGRectMake(0, 0, self.contentSize.width, self.bounds.size.height-20)];
        view.backgroundColor = [UIColor colorWithRed:1.000 green:0.981 blue:0.729 alpha:1.000];
        [self addSubview:view];
        
        for (int i = 0 ; i < count.count; i++) {
            
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50 * (i+1) -10,200, 20, 20)];
            label.text = count[i];
            label.font = [UIFont systemFontOfSize:12.0f];
            [self addSubview:label];
        }
    
    }
    
    return self;
}


@end
