//
//  PlusButton.swift
//  SevenSegment
//
//  Created by binaryboy on 6/27/16.
//  Copyright © 2016 Ahmed Hamdy. All rights reserved.
//

import UIKit

class PlusButton: UIButton {


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let w: CGFloat = CGRectGetWidth(self.frame)
        //NSLog(@"w : %f", w);
        let h: CGFloat = CGRectGetHeight(self.frame)
        //NSLog(@"h : %f", h);
        let padding: CGFloat = (h + w) * 0.5 * 0.1
        //NSLog(@"padding : %f", padding);
        let hx: CGFloat = (w / 2.0) - (padding)
        //NSLog(@"hx : %f", hx);
        let hy: CGFloat = (h / 2.0) - (padding)
        //NSLog(@"hy : %f", hy);
        let thickness: CGFloat = hy / 2.0
        //NSLog(@"thickness : %f", thickness);
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextClearRect(context, self.frame)
        CGContextSetStrokeColorWithColor(context, UIColor.cyanColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
        CGContextBeginPath(context)
        //+
        CGContextMoveToPoint(context, padding + hx - thickness / 2.0, padding)
        CGContextAddLineToPoint(context, padding + hx + thickness / 2.0, padding)
        CGContextAddLineToPoint(context, padding + hx + thickness / 2.0, padding + hy - thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx * 2.0, padding + hy - thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx * 2.0, padding + hy + thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx + thickness / 2.0, padding + hy + thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx + thickness / 2.0, padding + hy * 2.0)
        CGContextAddLineToPoint(context, padding + hx - thickness / 2.0, padding + hy * 2.0)
        CGContextAddLineToPoint(context, padding + hx - thickness / 2.0, padding + hy + thickness / 2.0)
        CGContextAddLineToPoint(context, padding, padding + hy + thickness / 2.0)
        CGContextAddLineToPoint(context, padding, padding + hy - thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx - thickness / 2.0, padding + hy - thickness / 2.0)
        CGContextAddLineToPoint(context, padding + hx - thickness / 2.0, padding)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        //    CGContextMoveToPoint(context, hx * 2.5 + hOffSet + hy, hx * 1.5 + hy + hz + vOffSet);
        //    CGContextAddArc(context, hx * 2.5 + hOffSet , hx * 1.5 + hy + hz + vOffSet, hy, 0, -6.28, 1);
        //    CGContextDrawPath(context, kCGPathFillStroke);
        CGContextFlush(context)
    }


}
