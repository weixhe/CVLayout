//
//  Demo2ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/24.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

class Demo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "测试 edges， size"
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.orange
        self.view.addSubview(v1)
        v1.cv.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(130)
            make.height.equalTo(100)
        }
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.blue
        v1.addSubview(v2)
        v2.cv.makeConstraints { (make) in
            make.edges.equalTo(10)
        }
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.red
        v2.addSubview(v3)
        v3.cv.makeConstraints { (make) in
            make.left.equalTo(v2).offset(10)
            make.top.equalTo(v2)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
        let v4 = UIView()
        v4.backgroundColor = UIColor.red
        v2.addSubview(v4)
        v4.cv.makeConstraints { (make) in
            make.left.equalTo(v3.cv.right).offset(10)
            make.top.equalTo(v2)
            make.size.equalTo(v3.cv.size)
        }
    }    
}
