//
//  ViewController.swift
//  BackingImage
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
        
        let image = UIImage(named: "Snowman")
        self.kbaseView.layer.contents = image?.CGImage
        
        self.kbaseView.layer.contentsGravity = kCAGravityResizeAspect
        if let scale = image?.scale {
            self.kbaseView.layer.contentsScale = scale
        }
        
        self.kbaseView.layer.masksToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

