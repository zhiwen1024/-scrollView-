//
//  TXLable.m
//  网易框架
//
//  Created by mac on 15-3-11.
//  Copyright (c) 2015年 zw. All rights reserved.
//

#import "TXLable.h"

@implementation TXLable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:12];
        self.textColor = [UIColor redColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

@end
