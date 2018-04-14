//
//  PathLine.m
//  JLsPathLine
//
//  Created by Georg Duemlein on 14/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import "PathLine.h"

@implementation PathLine
+ (instancetype) PathLineWithWidth:(int)width andHeight:(int)height
{
    PathLine *streak = [[PathLine alloc] initWithWidth:width andHeight:height];
    return streak;
}

- (id) initWithWidth:(int)width andHeight:(int)height{
    self = [super init];
    if (self)
    {
        self.width = width;
        self.height = height;
        self.posX = 0;
        self.posY = 0;
        
        self.colors = [NSMutableArray arrayWithCapacity:(4)];
        [self.colors addObject:[NSColor blackColor]];
        [self.colors addObject:[NSColor whiteColor]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                         green:35.0 / 255.0
                                                          blue:159.0 / 255.0
                                                         alpha:1.0]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                         green:78.0 / 255.0
                                                          blue:152.0 / 255.0
                                                         alpha:1.0]];
        [self.colors addObject:[NSColor colorWithCalibratedRed:97.0 / 255.0
                                                         green:35.0 / 255.0
                                                          blue:159.0 / 255.0
                                                         alpha:1.0]];
        
        [self.colors addObject:[NSColor colorWithCalibratedRed:240.0 / 255.0
                                                         green:78.0 / 255.0
                                                          blue:152.0 / 255.0
                                                         alpha:1.0]];
        
        self.shape = [[NSBezierPath alloc] init];
        [self reset];

    }
    return self;
}

- (void)reset
{
    [self.shape removeAllPoints];
    self.color =  [self.colors objectAtIndex:arc4random_uniform([self.colors count])];
    self.posX = 0;
    self.posY = (float)arc4random_uniform(self.height);
    [self.shape moveToPoint:CGPointMake(self.posX, self.posY)];
    CGFloat dash_pattern[]={((float)arc4random() / UINT32_MAX) * 10, ((float)arc4random() / UINT32_MAX) * 10};
    [self.shape setLineDash:dash_pattern count:1 phase:1];
    [self.shape setLineWidth: 1 + ((float)arc4random() / UINT32_MAX) * 4];
}

-(void) step
{
    if (self.posX > self.width) {
        [self reset];
    }
    
    self.posX += ((float)arc4random() / UINT32_MAX) * 50;
    self.posY += (((float)arc4random() / UINT32_MAX) * 2 - 1) * 50;
    if (self.posY < 0) {
        self.posY = 0;
    }
    if (self.posY > self.height) {
        self.posY = self.height;
    }
}

-(void) draw
{
    // [self.shape removeAllPoints];
    // float scale = (self.size) * 0.25;
    [self.color set];
    float offset_01 = (((float)arc4random() / UINT32_MAX) * 2 - 1) * 200;
    float offset_02 = (((float)arc4random() / UINT32_MAX) * 2 - 1) * 200;
    float offset_03 = (((float)arc4random() / UINT32_MAX) * 2 - 1) * 200;
    float offset_04 = (((float)arc4random() / UINT32_MAX) * 2 - 1) * 200;
    
    [self.shape curveToPoint:CGPointMake(self.posX, self.posY)
               controlPoint1:CGPointMake(self.posX + offset_01, self.posY + offset_02)
               controlPoint2:CGPointMake(self.posX + offset_03, self.posY + offset_04)];
    [self.shape stroke];
}
@end
