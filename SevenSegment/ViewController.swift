//
//  ViewController.swift
//  SevenSegment
//
//  Created by binaryboy on 6/27/16.
//  Copyright © 2016 Ahmed Hamdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: NSTimer?

    @IBOutlet var sevenSegmentPanel: SevenSegmentPanel!
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        sevenSegmentPanel.number = count

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // must be internal or public.
    func update() {
        // Something cool
        if count == 9 {
            count = 0
        }
        count += 1
        sevenSegmentPanel.number = count
    }
}
