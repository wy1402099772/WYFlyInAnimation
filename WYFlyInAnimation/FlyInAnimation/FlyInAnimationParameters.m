//
//  FlyInAnimationParameters.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "FlyInAnimationParameters.h"

@implementation FlyInAnimationParameters

#pragma mark - Pvivate
float myRandom(float min, float length) {
    return arc4random() % 100 * 1.0 / 100.0 * length + min;
}


#pragma mark - Public
+ (CGFloat)animationTimeOfFlyFromSide {
    return 0.5;
}

+ (CGFloat)animationTimeOfFlyInImage {
    return 0.4;
}

+ (CGFloat)delayTimeOfFlyInImage {
    return 0.3;
}

+ (CGFloat)animationTimeOfComboShrink {
    return 0.3;
}

+ (CGFloat)animationTimeOfComboRestore {
    return 0.2;
}

+ (CGFloat)timeOfSingleAnimation {
    return 2.0;
}

+ (NSArray *)queenOfProduceNumber:(NSInteger)delta {
    if(delta <= 0)
        return @[@(delta)];
    int step = 0;
    if(delta <= 3) {
        return @[@(delta)];
    } else if(delta < 10) {
        step = 2 + (int)myRandom(0, 2);
    } else if(delta < 100) {
        step = 3 + (int)myRandom(0, 3);
    } else {
        step = 5 + (int)myRandom(0, 5);
    }
    int left = (int)delta;
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0; i < step - 1; i++) {
        int tmp = (int)myRandom(1, left * 0.5);
        left -= tmp;
        [array addObject:@(tmp)];
    }
    [array addObject:@(left)];
    
    return [array copy];
}

@end
