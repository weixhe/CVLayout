//
//  Demo4ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/24.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

/// 测试 centerX  centerY  center
class Demo4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "测试 centerX  centerY  center"
        self.view.backgroundColor = UIColor.white
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.orange
        view.addSubview(v1)
        v1.cv.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.blue
        v1.addSubview(v2)
        v2.cv.makeConstraints { (make) in
            make.width.height.equalTo(v1).multipliedBy(0.8)
            make.center.equalTo(v1)
        }
        
        let v21 = UIView()
        v21.backgroundColor = UIColor.red
        v2.addSubview(v21)
        v21.cv.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(0)
        }
        
        let v22 = UIView()
        v22.backgroundColor = UIColor.red
        v2.addSubview(v22)
        v22.cv.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(v2.cv.right);
            make.centerY.equalTo(0)
        }
        
        
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.red
        view.addSubview(v3)
        v3.cv.makeConstraints { (make) in
            make.top.equalTo(v1.cv.bottom).offset(15)
            make.centerX.equalTo(v1.cv.centerX)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
}
