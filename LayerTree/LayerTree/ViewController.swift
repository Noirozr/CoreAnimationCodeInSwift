//
//  ViewController.swift
//  LayerTree
//
//  Created by liuyongjia on 15/10/10.
//  Copyright © 2015年 liuyongjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var kbaseView: UIView = UIView()
    var blueLayer: CALayer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.kbaseView.frame.size = CGSizeMake(200, 200)
        self.kbaseView.center = self.view.center
        self.kbaseView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.kbaseView)
        self.view.backgroundColor = UIColor.grayColor()
        
        
        blueLayer.delegate = self
        blueLayer.frame = CGRectMake(50, 50, 100, 100)
        blueLayer.backgroundColor = UIColor.blueColor().CGColor
        self.kbaseView.layer.addSublayer(blueLayer)
        
        blueLayer.display()
    }
    /**
    Method 01
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var point = touches.first?.locationInView(self.view)
        guard let kpoint = point else {
            return
        }
        point = self.kbaseView.layer.convertPoint(kpoint, fromLayer: self.view.layer)
        if self.kbaseView.layer.containsPoint(point!) {
            point = self.blueLayer.convertPoint(point!, fromLayer: self.kbaseView.layer)
            if self.blueLayer.containsPoint(point!) {
                let Alert = UIAlertController(title: "Inside Blue Layer", message: nil, preferredStyle: .Alert)
                let sureAction = UIAlertAction(title: "OK", style: .Default) { (action) in}
                Alert.addAction(sureAction)
                self.presentViewController(Alert, animated: true) {}
            } else {
                let Alert = UIAlertController(title: "Inside White Layer", message: nil, preferredStyle: .Alert)
                let sureAction = UIAlertAction(title: "OK", style: .Default) { (action) in}
                Alert.addAction(sureAction)
                self.presentViewController(Alert, animated: true) {}
            }
        }
        
    }
    
    */
    //Method 2
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let point = touches.first?.locationInView(self.view)
        let layer = self.kbaseView.layer.hitTest(point!)
        if layer == self.blueLayer {
            let Alert = UIAlertController(title: "Inside Blue Layer", message: nil, preferredStyle: .Alert)
            let sureAction = UIAlertAction(title: "OK", style: .Default) { (action) in}
            Alert.addAction(sureAction)
            self.presentViewController(Alert, animated: true) {}
        } else if layer == self.kbaseView.layer {
            let Alert = UIAlertController(title: "Inside White Layer", message: nil, preferredStyle: .Alert)
            let sureAction = UIAlertAction(title: "OK", style: .Default) { (action) in}
            Alert.addAction(sureAction)
            self.presentViewController(Alert, animated: true) {}
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

//Part 2 draw with CALayerDelegate
//Hint:  the view is the layer’s delegate
extension ViewController {
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        CGContextSetLineWidth(ctx, 10.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.redColor().CGColor)
        CGContextStrokeEllipseInRect(ctx, layer.bounds)
    }
}

