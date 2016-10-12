//
//  FlyInView.h
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlyInViewModel;

@interface FlyInView : UIView

- (void)startWithBaseNumber:(NSInteger)baseNumber;
- (void)add:(NSInteger)delta;
- (void)stop;

- (void)loadModel:(FlyInViewModel *)model;

@end
