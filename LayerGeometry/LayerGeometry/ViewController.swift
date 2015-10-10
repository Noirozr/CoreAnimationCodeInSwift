//
//  ViewController.swift
//  LayerGeometry
//
//  Created by liuyongjia on 15/10/10.
//  Copyright © 2015年 liuyongjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clockFace: UIImageView = UIImageView()
    var hourHand: UIImageView = UIImageView()
    var minuteHand: UIImageView = UIImageView()
    var secondHand: UIImageView = UIImageView()
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.p_constructSubviews()
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("tick"), userInfo: nil, repeats: true)
        self.tick()
    }
    
    func tick() {

        let calendar = NSCalendar(identifier: NSCalendarIdentifierChinese)
        let units: UInt = NSCalendarUnit.Hour.rawValue | NSCalendarUnit.Minute.rawValue | NSCalendarUnit.Second.rawValue
        let components: NSDateComponents =  (calendar?.components(NSCalendarUnit(rawValue: units), fromDate: NSDate()))!
        let hoursAngle = (Double(components.hour) / 12.0) * M_PI * 2.0
        let minsAngle = (Double(components.minute) / 60.0) * M_PI * 2.0
        let secsAngle = (Double(components.second) / 60.0) * M_PI * 2.0
        print(secsAngle)
        
        self.hourHand.transform = CGAffineTransformMakeRotation(CGFloat(hoursAngle))
        self.minuteHand.transform = CGAffineTransformMakeRotation(CGFloat(minsAngle))
        self.secondHand.transform = CGAffineTransformMakeRotation(CGFloat(secsAngle))
    }
    
    private func p_constructSubviews() {
        
        self.clockFace = UIImageView(image: UIImage(named: "ClockFace"))
        self.clockFace.center = self.view.center
        self.view.addSubview(self.clockFace)
        
        self.hourHand = UIImageView(image: UIImage(named: "HourHand"))
        self.hourHand.center = self.view.center
        self.view.addSubview(self.hourHand)
        
        self.minuteHand = UIImageView(image: UIImage(named: "MinuteHand"))
        self.minuteHand.center = self.view.center
        self.view.addSubview(self.minuteHand)
        
        self.secondHand = UIImageView(image: UIImage(named: "SecondHand"))
        self.secondHand.center = self.view.center
        self.view.addSubview(self.secondHand)
    
        self.secondHand.layer.anchorPoint = CGPointMake(0.5, 0.9)
        self.minuteHand.layer.anchorPoint = CGPointMake(0.5, 0.9)
        self.hourHand.layer.anchorPoint = CGPointMake(0.5, 0.9)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

