//
//  ViewController.swift
//  Visual Effects
//
//  Created by liuyongjia on 15/10/13.
//  Copyright © 2015年 liuyongjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var layerView1 = UIView()
    var layerView2 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        
        layerView1 = UIView(frame: CGRectMake(50, 50, 100, 100))
        layerView2 = UIView(frame: CGRectMake(70, 70, 100, 100))
        view.addSubview(layerView1)
        layerView1.addSubview(layerView2)
        
        layerView1.backgroundColor = UIColor.whiteColor()
        layerView1.layer.cornerRadius = 10
        layerView2.backgroundColor = UIColor.redColor()
        layerView2.layer.cornerRadius = 10
        
        layerView1.layer.opacity = 0.5
        layerView1.layer.shadowOffset = CGSizeMake(0.5, 0.5)
        layerView1.layer.shadowRadius = 5.0
        
        layerView1.layer.borderWidth = 3
        layerView2.layer.borderWidth = 3
        
        //layerView1.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

