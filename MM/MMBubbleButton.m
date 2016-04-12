//
//  MMBubbleButton.m
//  MM
//
//  Created by xiyang on 16/4/12.
//  Copyright © 2016年 jinwen.huang. All rights reserved.
//

#import "MMBubbleButton.h"

@interface MMBubbleButton() {
    
    CGPoint _startPoint;
    CGFloat _maxWidth;
    NSMutableSet *_recyclePool;
    NSMutableArray *_array;
}

@end

@implementation MMBubbleButton

- (instancetype)initWithFrame:(CGRect)frame maxLeft:(CGFloat)maxLeft maxRight:(CGFloat)maxRight maxHeight:(CGFloat)maxHeight {
    
    if (self = [super initWithFrame:frame]) {
        
        self.maxLeft = maxLeft;
        self.maxRight = maxRight;
        self.maxHeight = maxHeight;
        
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self initData];
    }
    return self;
}

#pragma mark - 初始化
- (void)initData {
    
    _array = [NSMutableArray array];
    _recyclePool = [NSMutableSet set];
}

- (void)generateBubbleInRandom {
    
    CALayer *layer;
    if (_recyclePool.count > 0) {
        
        layer = [_recyclePool anyObject]; // 随机取出一个图片
        [_recyclePool removeObject:layer]; // 有待商榷
    }
    else {
        
        UIImage *image = self.images[arc4random() % self.images.count];
        layer = [self createLayerWithImage:image];
    }
    
    [self.layer addSublayer:layer];
    [self generateBubbleWithCAlayer:layer];
}

- (void)generateBubbleWithImage:(UIImage *)image {
    
    CALayer *layer = [self createLayerWithImage:image];
    [self.layer addSublayer:layer];
    [self generateBubbleWithCAlayer:layer];
}

#pragma 私有方法

- (void)generateBubbleWithCAlayer:(CALayer *)layer {
    
    _maxWidth = _maxLeft + _maxRight;
    _startPoint = CGPointMake(self.frame.size.width / 2, 0);
    CGPoint endPoint = CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, _maxHeight);
    CGPoint controlPoint1 =
    CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, -_maxHeight * 0.2);
    CGPoint controlPoint2 =
    CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, -_maxHeight * 0.6);
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, _startPoint.x, _startPoint.y);
    CGPathAddCurveToPoint(curvedPath, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
    
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animation];
    keyFrame.keyPath = @"position";
    keyFrame.path = CFAutorelease(curvedPath);
    keyFrame.duration = self.duration;
    keyFrame.calculationMode = kCAAnimationPaced;
    
    [layer addAnimation:keyFrame forKey:@"keyFrame"];
    
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @1;
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
    scale.duration = 0.5;
    
    CABasicAnimation *alpha = [CABasicAnimation animation];
    alpha.keyPath = @"opacity";
    alpha.fromValue = @1;
    alpha.toValue = @0.1;
    alpha.duration = self.duration * 0.4;
    alpha.beginTime = self.duration - alpha.duration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyFrame, scale, alpha];
    group.duration = self.duration;
    group.delegate = self;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [layer addAnimation:group forKey:@"group"];
    [_array addObject:layer];
}

- (CGFloat)randomFloat {
    
    return (arc4random() % 100)/100.0f;
}

- (CALayer *)createLayerWithImage:(UIImage *)image {
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, image.size.width / scale, image.size.height / scale);
    layer.contents = (__bridge id)image.CGImage;
    return layer;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if (flag) {
        
        CALayer *layer = [_array firstObject];
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
        [_array removeObject:layer];
        [_recyclePool addObject:layer];
    }
}

@end
