//
//  FlyInAnimationParameters.h
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlyInAnimationParameters : NSObject

+ (CGFloat)animationTimeOfFlyFromSide;
+ (CGFloat)animationTimeOfFlyInImage;
+ (CGFloat)delayTimeOfFlyInImage;

+ (CGFloat)animationTimeOfComboShrink;
+ (CGFloat)animationTimeOfComboRestore;

+ (CGFloat)timeOfAddImterval;
+ (CGFloat)timeOfSingleAnimation;

+ (NSArray *)queenOfProduceNumber:(NSInteger)delta;

@end
