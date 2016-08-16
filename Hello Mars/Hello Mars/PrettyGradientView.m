//
//  PrettyGradientView.m
//  Hello Mars
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Alicia M. F. Key
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "PrettyGradientView.h"

@implementation PrettyGradientView


- (void)drawRect:(CGRect)rect
{
    CGFloat opaqueAlpha = 1.0;
    
    CGFloat gradientLocations[4] = {0.0, 0.25, 0.3, 1.0};
    
    CGFloat gradientColors[16] = {
        0.33, 0.75, 0.33, opaqueAlpha,
        0.98, 1.00, 0.98, opaqueAlpha,
        0.98, 0.98, 1.00, opaqueAlpha,
        0.33, 0.33, 0.75, opaqueAlpha
    };
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, gradientColors, gradientLocations, 4);
    
    CGPoint startPoint = CGPointMake(self.bounds.origin.x, self.bounds.origin.y);
    CGPoint endPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
}


@end
