//
//  ViewController.swift
//  Teleprompter
//
//  Created by Dayton Steffeny on 9/27/19.
//  Copyright © 2019 Dayton Steffeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tele: UITextView!
    
    var timer: Timer?
    var counts = 0
    var flip: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counts = Int(tele.contentSize.height/(tele.font?.lineHeight)!)*4
        
        var blank = ""
        for i in 1...counts/16 {
            blank += "\n"
        }
 
        tele.text = blank + tele.text
        tele.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    @objc func scroll(){
        self.counts += 1
        self.tele.scrollRangeToVisible(NSMakeRange(counts, 0))
    }

    @IBAction func playButtonClick(_ sender: Any) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(scroll), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseButtonClick(_ sender: Any) {
        timer?.invalidate()
    }
    
    @IBAction func stopButtonClick(_ sender: Any) {
        timer?.invalidate()
        counts = Int(tele.bounds.height/(tele.font?.lineHeight)!)-100
        self.tele.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    @IBAction func flipButtonClick(_ sender: Any) {
        if flip {
            tele.transform = CGAffineTransform.identity
        } else {
            tele.transform = CGAffineTransform(scaleX: -1, y: -1)
        }
         
        flip = !flip
    }
}


