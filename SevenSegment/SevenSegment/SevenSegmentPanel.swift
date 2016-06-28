//
//  SevenSegmentPanel.swift
//  SevenSegment
//
//  Created by binaryboy on 6/27/16.
//  Copyright © 2016 Ahmed Hamdy. All rights reserved.
//

import UIKit
import Darwin

class SevenSegmentPanel: UIView {


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    /*override func drawRect(rect: CGRect) {
     // Drawing code

     }*/


    override init(frame: CGRect) {
        super.init(frame: frame)

        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }



    var digitCount: Int = 0

    private var _number: Int = 0

    var number: Int {
        get { return _number }
        set {
            _number = newValue
            if _number == 0 {
                digitCount = 1
            } else {
                digitCount = Int(log10(Double(abs(_number)))) + 1
            }

            print("\(_number) -  \(digitCount)")
            self.setUp()
        }
    }


    var timer: NSTimer?

    func setUp() {
        //remove all subwiews
        //    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //        //NSLog(@"%@",obj);
        //        [((UIView *)obj) removeFromSuperview];
        //    } ];
        for kachal in 0 ..< self.subviews.count {
            self.subviews[kachal].removeFromSuperview()
        }
        //Add new subview digits
        var w: CGFloat = CGRectGetWidth(self.frame)
        var h: CGFloat = CGRectGetHeight(self.frame)
        if w > h {
            h = CGRectGetHeight(self.frame)
            h = h - h * 0.2
            w = CGRectGetWidth(self.frame)
            w = w - w * 0.2
            w = w / CGFloat(self.digitCount)
        } else {
            h = CGRectGetHeight(self.frame)
            h = h - h * 0.2
            w = CGRectGetWidth(self.frame)
            w = w - w * 0.2
            w = w / CGFloat(self.digitCount)
        }
        let a: CGFloat = 20
        let b: CGFloat = 20
        var offset: CGFloat = 0
        if 0 > Int(self.number) {
            let ssd: SevenSegmentDigit = SevenSegmentDigit(frame: CGRectMake(a + w * offset, b, w, h))
            print(ssd.frame)

            offset += 1
            ssd.character = "-"
            ssd.autoresizingMask = [.FlexibleWidth, .FlexibleLeftMargin, .FlexibleHeight, .FlexibleBottomMargin]
            ssd.contentMode = .Redraw
            self.addSubview(ssd)
        }
        //        for var i = offset; i < CInt(self.digitCount); i++
        for i in Int(offset) ..< Int(self.digitCount) {
            let ssd: SevenSegmentDigit = SevenSegmentDigit(frame: CGRectMake(a + w * CGFloat(i), b, w, h))
            print(ssd.frame)

            let index: Int = i - Int(offset)

            let numberInString =  String(abs(CInt(self.number)))
            let ch: Character = numberInString[index]

            ssd.character = ch

            let part1 =  Int(i > 0)
            let part2 =  Int((i + 1) < CInt(self.digitCount))
            let boolValue: Bool = Bool(part1 | part2)


            if i == 0 {
                ssd.autoresizingMask = [.FlexibleWidth, .FlexibleHeight, .FlexibleRightMargin, .FlexibleBottomMargin]
            } else if  boolValue {
                ssd.autoresizingMask = [.FlexibleWidth, .FlexibleHeight, .FlexibleLeftMargin, .FlexibleRightMargin, .FlexibleBottomMargin]
            } else {
                ssd.autoresizingMask = [.FlexibleWidth, .FlexibleHeight, .FlexibleLeftMargin, .FlexibleBottomMargin]
            }

            ssd.contentMode = .Redraw
            ssd.layer.needsDisplayOnBoundsChange = true
            self.addSubview(ssd)
        }
    }




}
extension String {

    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}
