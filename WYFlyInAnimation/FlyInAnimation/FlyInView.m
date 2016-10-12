//
//  FlyInView.m
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/10.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import "FlyInView.h"
#import "ComboView.h"

@interface FlyInView ()

@property (nonatomic, strong) UIView        *backView;
@property (nonatomic, strong) UIImageView   *avatarImageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *descriptionLabel;
@property (nonatomic, strong) UIImageView   *flyImageView;
@property (nonatomic, strong) ComboView     *comboView;

@property (nonatomic, strong) NSTimer       *timer;

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
- (void)start {
    [self restartTimer];
    
    [self showFromSide];
    [self showFlyImage];
}

- (void)add:(NSInteger)delta {
    [self restartTimer];
}

- (void)stop {
    [self hide];
    
    [self clearTimer];
}

#pragma mark - Private
- (void)configureView {
    [self addSubview:self.backView];
    [self addSubview:self.avatarImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descriptionLabel];
    [self addSubview:self.flyImageView];
}

- (void)showFromSide {
    [UIView animateWithDuration:0.5 animations:^() {
        CGRect rect = self.frame;
        rect.origin.x = 0;
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        if(finished) {
            
        }
    }];
}

- (void)showFlyImage {
    [UIView animateWithDuration:0.4 delay:0.3 options:UIViewAnimationOptionLayoutSubviews animations:^() {
        [self.flyImageView setFrame:CGRectMake(138, -8, 52, 52)];
    } completion:^(BOOL finished) {
        if(finished) {
            [self addSubview:self.comboView];
            [self.comboView add:1];
        }
    }];
}

- (void)hide {
    [self removeFromSuperview];
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
        _backView = [[UIView alloc] initWithFrame:CGRectMake(4, 0, 190, 36)];
        _backView.layer.cornerRadius = 18;
        _backView.backgroundColor = [UIColor colorWithDisplayP3Red:0 green:0 blue:0 alpha:0.2];
    }
    return _backView;
}

- (UIImageView *)avatarImageView {
    if(!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4, 2, 32, 32)];
        _avatarImageView.image = [UIImage imageNamed:@"avatar"];
        _avatarImageView.layer.cornerRadius = 16;
        _avatarImageView.layer.masksToBounds = YES;
    }
    return _avatarImageView;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 0, 155, 18)];
        _titleLabel.text = @"犀利哥";
        _titleLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Book" size:13];
    }
    return _titleLabel;
}

- (UILabel *)descriptionLabel {
    if(!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 18, 155, 18)];
        _descriptionLabel.text = @"送一个我要上学";
        _descriptionLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Book" size:13];
        _descriptionLabel.textColor = [UIColor colorWithRed:1 green:0.93 blue:0.04 alpha:1];
    }
    return _descriptionLabel;
}

- (UIImageView *)flyImageView {
    if(!_flyImageView) {
        _flyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-52, -8, 52, 52)];
        _flyImageView.image = [UIImage imageNamed:@"xiaoyingNormal"];
    }
    return _flyImageView;
}

- (ComboView *)comboView {
    if(!_comboView) {
        _comboView = [[ComboView alloc] initWithFrame:CGRectMake(196, 0, 110, 56)];
    }
    return _comboView;
}

@end
