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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.kbaseView.frame.size = CGSizeMake(200, 200)
        self.kbaseView.center = self.view.center
        self.kbaseView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.kbaseView)
        self.view.backgroundColor = UIColor.grayColor()
        
        
        let blueLayer = CALayer()
        blueLayer.delegate = self
        blueLayer.frame = CGRectMake(50, 50, 100, 100)
        blueLayer.backgroundColor = UIColor.blueColor().CGColor
        self.kbaseView.layer.addSublayer(blueLayer)
        
        blueLayer.display()
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

