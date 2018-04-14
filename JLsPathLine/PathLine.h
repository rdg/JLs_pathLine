//
//  PathLine.h
//  JLsPathLine
//
//  Created by Georg Duemlein on 14/04/18.
//  Copyright © 2018 Georg Duemlein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/Appkit.h>

@interface PathLine : NSObject

@property (assign) int width;
@property (assign) int height;
@property (assign) float posX;
@property (assign) float posY;

@property (nonatomic, retain) NSMutableArray *colors;
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, retain) NSBezierPath *shape;
@property (nonatomic, assign) NSSize *size;

+ (instancetype) PathLineWithWidth:(int)width andHeight:(int)height;
- (id) initWithWidth:(int)width andHeight:(int)height;

- (void) reset;
- (void) step;
- (void) draw;

@end
