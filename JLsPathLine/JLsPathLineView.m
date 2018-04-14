//
//  JLsPathLineView.m
//  JLsPathLine
//
//  Created by Georg Duemlein on 14/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "JLsPathLineView.h"

@implementation JLsPathLineView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/60.0];
        
        self.streaks =  [NSMutableArray arrayWithCapacity:(16)];
        for(int col=0; col < 5; col++) {
            [self.streaks addObject: [PathLine PathLineWithWidth:self.bounds.size.width andHeight:self.bounds.size.height]];
        }
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [[NSColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1] set];
    NSRect bounds = [self bounds];
    [[NSBezierPath bezierPathWithRect:bounds] fill];
    
    for (PathLine *streak in self.streaks) {
        [streak step];
        [streak draw];
    }
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
