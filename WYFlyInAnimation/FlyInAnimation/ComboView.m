//
//  ComboView.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "ComboView.h"
#import "FlyInAnimationParameters.h"

@interface ComboView ()

@property (nonatomic, assign) NSInteger         indicatorNumber;
@property (nonatomic, strong) UILabel           *indicatorLabel;
@property (nonatomic, assign) CGAffineTransform logTransform;

@end

@implementation ComboView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.indicatorNumber = 0;
        [self configureViews];
    }
    return self;
}

#pragma mark - Public
- (void)add:(NSInteger)delta {
    [self.indicatorLabel removeFromSuperview];
    self.indicatorLabel = nil;
    
    _indicatorNumber += delta;
    [self configureViews];
    
    [UIView animateWithDuration:[FlyInAnimationParameters animationTimeOfComboShrink] animations:^() {
        CGAffineTransform tmp = CGAffineTransformTranslate(self.logTransform, 30, 30);
        tmp = CGAffineTransformScale(tmp, 0.2, 0.1);
        self.logTransform = tmp;
        self.indicatorLabel.transform = tmp;
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:[FlyInAnimationParameters animationTimeOfComboRestore] delay:[FlyInAnimationParameters animationTimeOfComboShrink] options:UIViewAnimationOptionLayoutSubviews animations:^() {
        CGAffineTransform tmp =  CGAffineTransformScale(self.logTransform, 2.3, 4.6);
        tmp = CGAffineTransformTranslate(tmp, 10, 0);
        self.logTransform = tmp;
        self.indicatorLabel.transform = tmp;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.2 delay:[FlyInAnimationParameters animationTimeOfComboRestore] + [FlyInAnimationParameters animationTimeOfComboShrink] options:UIViewAnimationOptionLayoutSubviews animations:^() {
        CGAffineTransform tmp =  CGAffineTransformScale(self.logTransform, 0.81, 0.81);
//        tmp = CGAffineTransformTranslate(tmp, 5, 0);
        self.logTransform = tmp;
        self.indicatorLabel.transform = tmp;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.1 delay:[FlyInAnimationParameters animationTimeOfComboRestore] + [FlyInAnimationParameters animationTimeOfComboShrink]  + 0.2 options:UIViewAnimationOptionLayoutSubviews animations:^() {
        CGAffineTransform tmp =  CGAffineTransformScale(self.logTransform, 1.14, 1.14);
        //        tmp = CGAffineTransformTranslate(tmp, 5, 0);
        self.logTransform = tmp;
        self.indicatorLabel.transform = tmp;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Private
- (void)configureViews {
    [self addSubview:self.indicatorLabel];
}


#pragma mark - Getter
- (UILabel *)indicatorLabel {
    if(!_indicatorLabel) {
        _indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(-200, -60, 300, 100)];
        _indicatorLabel.text = [NSString stringWithFormat:@"× %d", _indicatorNumber];
        _indicatorLabel.textColor = [UIColor colorWithRed:1 green:0.93 blue:0.04 alpha:1];
        _indicatorLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Book" size:80];
        _indicatorLabel.textAlignment = NSTextAlignmentLeft;
        _logTransform = self.transform;
    }
    return _indicatorLabel;
}

#pragma mark - Setter
- (void)setIndicatorNumber:(NSInteger)indicatorNumber {
    _indicatorNumber = indicatorNumber;
}

@end
