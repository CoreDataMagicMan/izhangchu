//
//  MainCell.m
//  iZhangChu
//
//  Created by iJeff on 15/8/26.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //imgView
        _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imgView];
        
    }
    return self;
}






@end



