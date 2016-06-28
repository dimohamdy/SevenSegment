//
//  SevenSegmentDigit.swift
//  SevenSegment
//
//  Created by binaryboy on 6/27/16.
//  Copyright © 2016 Ahmed Hamdy. All rights reserved.
//

import UIKit

class SevenSegmentDigit: UIView {


    var digit: Int = 0
    var mainColor: UIColor?
    var character: Character?
    var dotIsOn: Bool?
    func SSSetContextColorsFor(chr: Character, digits: [String], inContext context: CGContextRef) {
        //    if ([onDigits indexOfObject:dig]==NSNotFound)
        let stringDigits: String = digits.joinWithSeparator("")
        if stringDigits.lowercaseString.characters.indexOf(chr) != nil {
            CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
            CGContextSetFillColorWithColor(context, UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 0.5).CGColor)
            CGContextSetShadowWithColor(context, CGSize(width: 1.5, height: 1.5), 10.0, UIColor(red: 0.6, green: 0.0, blue: 0.1, alpha: 1.0).CGColor)
        } else {

            CGContextSetStrokeColorWithColor(context, UIColor(white: 0.3, alpha: 0.4).CGColor)
            CGContextSetFillColorWithColor(context, UIColor(white: 0.15, alpha: 0.3).CGColor)
            CGContextSetShadowWithColor(context, CGSize(width: 1.5, height: 1.5), 10.0, UIColor(white: 1.0, alpha: 0.3).CGColor)
        }
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code

        var h: CGFloat = 0
        var w: CGFloat = 0
        var hx: CGFloat = 0
        var hy: CGFloat = 0
        var hz: CGFloat = 0
        var vOffSet: CGFloat = 0
        var hOffSet: CGFloat = 0
        var filler: CGFloat = 0
        var adj: CGFloat = 0.0
        if character == nil {
            character = "0"
        }
        var part1 =  Int((hx + hy + hz + hy + vOffSet + filler * 3) > (h * 0.9))
        var part2 =  Int(w == 0)
        var boolValue: Bool = Bool(part1 | part2)
        while boolValue {

            w = CGRectGetWidth(self.frame)
            //NSLog("w%f", w)
            h = CGRectGetHeight(self.frame)
            //    if (w>h) {
            //        w = h / 2.0f;
            //    }
            hx = (w / 7.5) - adj
            // /10.0; //30.5f;
            //NSLog("hx%f", hx)
            hy = hx / 2.0
            // / 3.0f; //10.0f;
            //NSLog("hy%f", hy)
            hz = hx * 3
            // * 2; //60.0f;
            //NSLog("hz%f", hz)
            vOffSet = hz + 2 * hy
            //80.0f;
            //NSLog("vOff%f", vOffSet)
            hOffSet = hz + 2 * hy
            //80.0f;
            //NSLog("hoff%f", hOffSet)
            filler = hx * 0.05
            // 1.5f;
            adj += 5

            part1 =  Int((hx + hy + hz + hy + vOffSet + filler * 3) > (h * 0.9))
            part2 =  Int(w == 0)
            boolValue = Bool(part1 | part2)
        }
        //        hx +=  hy
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextClearRect(context, self.frame)
        CGContextSetStrokeColorWithColor(context, SevenSegmentDigit.redColor())
        CGContextSetFillColorWithColor(context, UIColor.purpleColor().CGColor)
        CGContextBeginPath(context)
        //    NSArray * one = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil];
        //    [self SSSetContextColorsFor:digit  with:one inContext:context];
        let F: [String] = ["4", "5", "6", "8", "9", "0"]
        self.SSSetContextColorsFor(character!, digits: F, inContext: context)
        //1
        CGContextMoveToPoint(context, hx - filler, hx + filler)
        CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + filler)
        CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + hz + filler)
        CGContextAddLineToPoint(context, hx - filler, hx + hy + hz + hy + filler)
        CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + hz + filler)
        CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + filler)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let A: [String] = ["2", "3", "5", "6", "7", "8", "9", "0"]
        self.SSSetContextColorsFor(character!, digits: A, inContext: context)
        //2
        CGContextMoveToPoint(context, hx, hx - filler)
        CGContextAddLineToPoint(context, hx + hy, hx + hy - filler)
        CGContextAddLineToPoint(context, hx + hy + hz, hx + hy - filler)
        CGContextAddLineToPoint(context, hx + hy + hz + hy, hx - filler)
        CGContextAddLineToPoint(context, hx + hy + hz, hx - hy - filler)
        CGContextAddLineToPoint(context, hx + hy, hx - hy - filler)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let B: [String] = ["1", "2", "3", "4", "7", "8", "9", "0"]
        self.SSSetContextColorsFor(character!, digits: B, inContext: context)
        //3
        CGContextMoveToPoint(context, hx + hOffSet + filler * 1, hx + filler)
        CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + filler)
        CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + hz + filler)
        CGContextAddLineToPoint(context, hx + hOffSet + filler * 1, hx + hy + hz + hy + filler)
        CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + hz + filler)
        CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + filler)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let G: [String] = ["2", "3", "4", "5", "6", "8", "9", "-"]
        self.SSSetContextColorsFor(character!, digits: G, inContext: context)
        //4
        CGContextMoveToPoint(context, hx, hx + vOffSet + filler * 2)
        CGContextAddLineToPoint(context, hx + hy, hx + hy + vOffSet + filler * 2)
        CGContextAddLineToPoint(context, hx + hy + hz, hx + hy + vOffSet + filler * 2)
        CGContextAddLineToPoint(context, hx + hy + hz + hy, hx + vOffSet + filler * 2)
        CGContextAddLineToPoint(context, hx + hy + hz, hx - hy + vOffSet + filler * 2)
        CGContextAddLineToPoint(context, hx + hy, hx - hy + vOffSet + filler * 2)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let E: [String] = ["2", "6", "8", "0"]
        self.SSSetContextColorsFor(character!, digits: E, inContext: context)
        //5
        CGContextMoveToPoint(context, hx - filler, hx + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + hz + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx - filler, hx + hy + hz + hy + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + hz + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + vOffSet + filler * 3)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let D: [String] = ["2", "3", "5", "6", "8", "9", "0"]
        self.SSSetContextColorsFor(character!, digits: D, inContext: context)
        //6
        CGContextMoveToPoint(context, hx, hx + vOffSet * 2 + filler * 4)
        CGContextAddLineToPoint(context, hx + hy, hx + hy + vOffSet * 2 + filler * 4)
        CGContextAddLineToPoint(context, hx + hy + hz, hx + hy + vOffSet * 2 + filler * 4)
        CGContextAddLineToPoint(context, hx + hy + hz + hy, hx + vOffSet * 2 + filler * 4)
        CGContextAddLineToPoint(context, hx + hy + hz, hx - hy + vOffSet * 2 + filler * 4)
        CGContextAddLineToPoint(context, hx + hy, hx - hy + vOffSet * 2 + filler * 4)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let C: [String] = ["1", "3", "4", "5", "6", "7", "8", "9", "0"]
        self.SSSetContextColorsFor(character!, digits: C, inContext: context)
        //7
        CGContextMoveToPoint(context, hx + hOffSet + filler * 1, hx + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + hz + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx + hOffSet + filler * 1, hx + hy + hz + hy + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + hz + vOffSet + filler * 3)
        CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + vOffSet + filler * 3)
        CGContextClosePath(context)
        CGContextDrawPath(context, .FillStroke)
        let doted: [String] = ["1"]
        if dotIsOn == true {
            self.SSSetContextColorsFor(Character("1"), digits: doted, inContext: context)

        } else {
            self.SSSetContextColorsFor(Character("0"), digits: doted, inContext: context)

        }
        //dot
        CGContextMoveToPoint(context, hx * 2.5 + hOffSet + hy, hx * 1.5 + hy + hz + vOffSet)
        CGContextAddArc(context, hx * 2.5 + hOffSet, hx * 1.5 + hy + hz + vOffSet, hy, 0, -6.28, 1)
        CGContextDrawPath(context, .FillStroke)
        CGContextFlush(context)

    }

    class func genericRGBSpace() -> CGColorSpaceRef {
        var space: CGColorSpaceRef? = nil
        if space == nil {
            space = CGColorSpaceCreateDeviceRGB()
        }
        return space!
    }

    class func redColor() -> CGColorRef {
        var red: CGColorRef? = nil
        if red == nil {
            let values: [CGFloat] = [1.0, 0.0, 0.0, 1.0]
            red = CGColorCreate(self.genericRGBSpace(), values)
        }
        return red!
    }
}
extension Bool {
    init<T: IntegerType>(_ integer: T) {
        if integer == 0 {
            self.init(false)
        } else {
            self.init(true)
        }
    }
}
