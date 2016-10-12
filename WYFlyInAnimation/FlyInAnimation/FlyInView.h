//
//  FlyInView.h
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlyInViewDelegate <NSObject>

- (void)flyInViewDidDismiss:(NSString *)identifier;

@end

@class FlyInViewModel;

@interface FlyInView : UIView

- (void)startWithBaseNumber:(NSInteger)baseNumber;
- (void)add:(NSInteger)delta;
- (void)stop;

- (void)loadModel:(FlyInViewModel *)model;
- (BOOL)isEqualToIdentifier:(NSString *)identifier;

@property (nonatomic, weak) id<FlyInViewDelegate> delegate;

@end
