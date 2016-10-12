//
//  FlyInAnimationManager.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "FlyInAnimationManager.h"
#import "FlyInView.h"
#import "FlyInAnimationParameters.h"
#import "FlyInViewModel.h"

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


#pragma mark - Public 
- (void)showWithAvatar:(NSString *)avatar type:(FlyInType)type number:(NSInteger)amount baseNumber:(NSInteger)baseNumber identifier:(NSString *)identifier {
    NSArray *delta = [FlyInAnimationParameters queenOfProduceNumber:amount - baseNumber];
    
}

#pragma mark - Private
- (void)arrangeTask:(NSArray *)array index:(NSInteger)i inFlyInView:(FlyInView *)view {
    if(i >= array.count) {
        return;
    }
    
    
    
}

@end
