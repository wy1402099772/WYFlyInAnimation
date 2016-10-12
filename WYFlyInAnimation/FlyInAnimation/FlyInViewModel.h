//
//  FlyInViewModel.h
//  WYFlyInAnimation
//
//  Created by wyan assert on 2016/10/12.
//  Copyright © 2016年 wyan assert. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FlyInType) {
    FlyInTypeFollow,
    FlyInTypeGoldenFollow,
    FlyInTypeView,
    FlyInTypeLike,
    FlyInTypeComment
};

@interface FlyInViewModel : NSObject

@property (nonatomic, strong) NSString      *avatarString;
@property (nonatomic, assign) FlyInType     modelType;
@property (nonatomic, strong) NSString      *identifier;
@property (nonatomic, assign) NSInteger     showNumber;
@property (nonatomic, strong) NSString      *showString;

@end
