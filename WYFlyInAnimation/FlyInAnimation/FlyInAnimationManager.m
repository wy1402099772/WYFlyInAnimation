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

static NSInteger MAXFlyInViewNumber = 5;
static CGFloat   TopIntervalHeight = 35;
static CGFloat   SingleFlyInViewHeight = 52;

@interface FlyInAnimationManager () <FlyInViewDelegate>

@property (nonatomic, weak)     UIView                      *associatedView;
@property (nonatomic, strong)   NSMutableArray<FlyInView *> *container;

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
    if(self.container.count >= MAXFlyInViewNumber) {
        return ;
    }
    for(int i = 0; i < self.container.count; i++) {
        if([self.container[i] isEqualToIdentifier:identifier]) {
            return ;
        }
    }
    
    NSArray *deltaArray = [FlyInAnimationParameters queenOfProduceNumber:amount - baseNumber];
    
    FlyInView *flyInView = [self getViewWithAvatar:avatar type:type baseNumber:baseNumber identifier:identifier andIndex:self.container.count];
    [self.associatedView addSubview:flyInView];
    [self.container addObject:flyInView];
    
    [self arrangeTask:deltaArray index:0 inFlyInView:flyInView];
}

#pragma mark - Private
- (void)arrangeTask:(NSArray <NSNumber *>*)array index:(NSInteger)i inFlyInView:(FlyInView *)view {
    if(i >= array.count) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([FlyInAnimationParameters timeOfAddImterval] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view add:[array[i] integerValue]];
        [self arrangeTask:array index:i + 1 inFlyInView:view];
    });
    
}

- (FlyInView *)getViewWithAvatar:(NSString *)avatar type:(FlyInType)type baseNumber:(NSInteger)baseNumber identifier:(NSString *)identifier andIndex:(NSInteger)index {
    FlyInView *flyInView = [[FlyInView alloc] initWithFrame:CGRectMake(-300, TopIntervalHeight + SingleFlyInViewHeight * index, 300, 44)];
    
    FlyInViewModel *model = [[FlyInViewModel alloc] init];
    model.avatarString = avatar;
    model.showString = @"New Arrival!!!";
    model.modelType = type;
    model.identifier = identifier;
    
    flyInView.delegate = self;
    [flyInView loadModel:model];
    [flyInView startWithBaseNumber:baseNumber];
    return flyInView;
}


#pragma mark - FlyInViewDelegate
- (void)flyInViewDidDismiss:(NSString *)identifier {
    NSInteger i = 0;
    for( ; i < self.container.count; i++) {
        if([self.container[i] isEqualToIdentifier:identifier]) {
            break;
        }
    }
    if(i < 0 || i >= self.container.count) {
        return ;
    }
    NSInteger index = i;
    for(i++; i < self.container.count; i++) {
        [UIView animateWithDuration:0.3 animations:^() {
            CGRect tmp = self.container[i].frame;
            tmp.origin.y -= SingleFlyInViewHeight;
            [self.container[i] setFrame:tmp];
        }];
    }
    [self.container removeObjectAtIndex:index];
}

#pragma mark - Getter 
- (NSMutableArray<FlyInView *> *)container {
    if(!_container) {
        _container = [NSMutableArray array];
    }
    return _container;
}

@end
