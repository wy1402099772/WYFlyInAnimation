//
//  FlyInView.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "FlyInView.h"
#import "ComboView.h"
#import "FlyInAnimationParameters.h"
#import "FlyInViewModel.h"

@interface FlyInView ()

@property (nonatomic, strong) UIView            *backView;
@property (nonatomic, strong) UIImageView       *avatarImageView;
//@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UILabel           *descriptionLabel;
@property (nonatomic, strong) UIImageView       *flyImageView;
@property (nonatomic, strong) ComboView         *comboView;

@property (nonatomic, strong) FlyInViewModel    *model;

@property (nonatomic, strong) NSTimer           *timer;

@end

@implementation FlyInView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self configureView];
    }
    return self;
}

- (void)dealloc {
    [self clearTimer];
}

#pragma mark - Public
- (void)startWithBaseNumber:(NSInteger)baseNumber {
    [self.comboView setIndicatorNumber:baseNumber];
    
    [self restartTimer];
    
    [self showFromSide];
    [self showFlyImage];
}

- (void)add:(NSInteger)delta {
    [self restartTimer];
    
    self.comboView.hidden = NO;
    [self.comboView add:delta];
}

- (void)stop {
    [self hide];
    
    [self clearTimer];
}

- (void)loadModel:(FlyInViewModel *)model {
    self.model = model;
    self.avatarImageView.image = [UIImage imageNamed:model.avatarString];
    self.descriptionLabel.text = model.showString;
//    self.flyImageView.image = [UIImage imageNamed:@"xiaoyingNormal"];
    switch (model.modelType) {
        case FlyInTypeFollow:
            self.flyImageView.image = [UIImage imageNamed:@"image_spin_reward_followers"];
            self.avatarImageView.layer.cornerRadius = 17;
            break;
        case FlyInTypeComment:
            self.flyImageView.image = [UIImage imageNamed:@"image_spin_reward_comments"];
            self.avatarImageView.layer.cornerRadius = 3;
            break;
        case FlyInTypeView:
            self.flyImageView.image = [UIImage imageNamed:@"image_spin_reward_views"];
            self.avatarImageView.layer.cornerRadius = 3;
            break;
        case FlyInTypeLike:
            self.flyImageView.image = [UIImage imageNamed:@"image_spin_reward_likes"];
            self.avatarImageView.layer.cornerRadius = 3;
            break;
        default:
            self.flyImageView.image = nil;
            break;
    }
}

- (BOOL)isEqualToIdentifier:(NSString *)identifier {
    return [self.model.identifier isEqualToString:identifier];
}

#pragma mark - Private
- (void)configureView {
    [self addSubview:self.backView];
    [self addSubview:self.avatarImageView];
//    [self addSubview:self.titleLabel];
    [self addSubview:self.descriptionLabel];
    [self addSubview:self.flyImageView];
}

- (void)showFromSide {
    [UIView animateWithDuration:[FlyInAnimationParameters animationTimeOfFlyFromSide] delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^() {
        CGRect rect = self.frame;
        rect.origin.x = 0;
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        if(finished) {
            
        }
    }];
}

- (void)showFlyImage {
    [UIView animateWithDuration:[FlyInAnimationParameters animationTimeOfFlyInImage] delay:[FlyInAnimationParameters delayTimeOfFlyInImage] options:UIViewAnimationOptionCurveEaseIn animations:^() {
        [self.flyImageView setFrame:CGRectMake(148, 5, 30, 30)];
    } completion:^(BOOL finished) {
        if(finished) {
            [self addSubview:self.comboView];
//            [self.comboView add:1];
        }
    }];
}

- (void)hide {
    [UIView animateWithDuration:[FlyInAnimationParameters animationTimeOfFlyFromSide] delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^() {
        self.alpha = 0;
        CGRect rect = self.frame;
        rect.origin.x = -300;
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        if(finished) {
            [self removeFromSuperview];
            if(self.delegate && [self.delegate respondsToSelector:@selector(flyInViewDidDismiss:)]) {
                [self.delegate flyInViewDidDismiss:self.model.identifier];
            }
        }
    }];
}

- (void)clearTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)restartTimer {
    [self clearTimer];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - Getter
- (UIView *)backView {
    if(!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(-22, 0, 185 + 22, 44)];
        _backView.layer.cornerRadius = 22;
        _backView.backgroundColor = [UIColor colorWithDisplayP3Red:0 green:0 blue:0 alpha:0.6];
    }
    return _backView;
}

- (UIImageView *)avatarImageView {
    if(!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 35, 35)];
//        _avatarImageView.image = [UIImage imageNamed:@"avatar"];
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

//- (UILabel *)titleLabel {
//    if(!_titleLabel) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, 155, 18)];
//        _titleLabel.text = @"犀利哥";
//        _titleLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Book" size:13];
//    }
//    return _titleLabel;
//}

- (UILabel *)descriptionLabel {
    if(!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(56, 11, 85, 20)];
//        _descriptionLabel.text = @"送一个我要上学";
        _descriptionLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Book" size:14];
        _descriptionLabel.textColor = [UIColor colorWithRed:1 green:0.93 blue:0.04 alpha:1];
    }
    return _descriptionLabel;
}

- (UIImageView *)flyImageView {
    if(!_flyImageView) {
        _flyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-52, 5, 30, 30)];
//        _flyImageView.image = [UIImage imageNamed:@"xiaoyingNormal"];
    }
    return _flyImageView;
}

- (ComboView *)comboView {
    if(!_comboView) {
        _comboView = [[ComboView alloc] initWithFrame:CGRectMake(270, 0, 110, 56)];
        _comboView.hidden = YES;
    }
    return _comboView;
}

@end
