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
    NSArray *deltaArray = [FlyInAnimationParameters queenOfProduceNumber:amount - baseNumber];
    
    FlyInView *flyInView = [[FlyInView alloc] initWithFrame:CGRectMake(-300, 50, 300, 44)];
    
    FlyInViewModel *model = [[FlyInViewModel alloc] init];
    model.avatarString = avatar;
    model.showString = @"New Arrival!!!";
    model.modelType = type;
    
    [flyInView loadModel:model];
    
    [self.associatedView addSubview:flyInView];
    [flyInView startWithBaseNumber:baseNumber];
    
    [self arrangeTask:deltaArray index:0 inFlyInView:flyInView];
}

#pragma mark - Private
- (void)arrangeTask:(NSArray <NSNumber *>*)array index:(NSInteger)i inFlyInView:(FlyInView *)view {
    if(i >= array.count) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view add:[array[i] integerValue]];
        [self arrangeTask:array index:i + 1 inFlyInView:view];
    });
    
}

@end
