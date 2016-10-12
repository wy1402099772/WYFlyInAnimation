//
//  FlyInAnimationManager.h
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlyInViewModel.h"

@interface FlyInAnimationManager : NSObject

- (instancetype)initWithAssociatedView:(UIView *)associatedView;

- (void)showWithAvatar:(NSString *)avatar type:(FlyInType)type number:(NSInteger)amount baseNumber:(NSInteger)baseNumber identifier:(NSString *)identifier;

@end
