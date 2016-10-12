//
//  FlyInAnimationManager.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "FlyInAnimationManager.h"

@interface FlyInAnimationManager ()

@property (nonatomic, weak) UIView *associatedView;

@end

@implementation FlyInAnimationManager

- (instancetype)initWithAssociatedView:(UIView *)associatedView {
    if(self = [super init]) {
        _associatedView = associatedView;
    }
    return self;
}



@end
