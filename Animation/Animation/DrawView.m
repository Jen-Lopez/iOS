//
//  DrawView.m
//  games
//
//  Created by Jennifer Lopez on 3/13/20.
//  Copyright © 2020 JenLopez. All rights reserved.

// should include both straight lines, arcs, and at least one gradient
#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    if (self.drawImg == YES){
        [self drawHead];
        [self drawEyes];
        [self drawNose];
        [self drawMouth];
    }
}

- (void) drawHead {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef brown = [[UIColor brownColor]CGColor];

    CGContextTranslateCTM(context, 150, 200);
    int rotations = 16;
    float amount = M_PI_2/ (double)rotations;
    for (int i = 0; i < rotations; i++) {
        CGContextRotateCTM(context, amount);
        CGContextAddRect(context, CGRectMake(-128, -128, 210, 210));
    }
    CGContextSetStrokeColorWithColor(context, brown);
    CGContextSetLineWidth(context, 1.5f);
    CGContextStrokePath(context);
}
- (void) drawEyes {
    CGColorRef black = [[UIColor blackColor]CGColor];
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect leftEye =  CGRectMake(-80, 20, 60, 40);
    CGRect rightEye = CGRectMake(-80, -50, 60, 40);
    CGContextAddEllipseInRect(context,leftEye);
    CGContextAddEllipseInRect(context, rightEye);
    CGContextSetStrokeColorWithColor(context, black);
    CGContextStrokePath(context);

    CGRect leftPupil = CGRectMake(-60, 25, 40, 30);
    CGRect rightPupil = CGRectMake(-60, -45, 40, 30);

    CGContextFillEllipseInRect(context, leftPupil);
    CGContextFillEllipseInRect(context, rightPupil);

    CGContextSetLineWidth(context, 2.0f);
    CGContextStrokePath(context);
}

- (void) drawNose {
    CGColorRef pink = [[UIColor systemPinkColor]CGColor];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 0, 10);
    CGContextAddLineToPoint(context, 25, -5);
    CGContextAddLineToPoint(context, 25, 25);
    
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, pink);
    CGContextFillPath(context);
}

- (void) drawMouth{
    CGColorRef black = [[UIColor blackColor]CGColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context, 40.0, 15.0, 15.0, -1, -5, 0);
    CGContextSetStrokeColorWithColor(context, black);
    CGContextSetLineWidth(context, 2.0f);
    CGContextStrokePath(context);
}

@end
