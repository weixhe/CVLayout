//
//  Demo1ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/21.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

class Demo1ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "测试 left, top, right, bottom, offset"

        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        view.addSubview(v1)
        v1.cv.makeConstraints { (maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(10)
            maker.top.equalTo(100)
            maker.bottom.equalTo(100)
        }
        
        let v11 = UIView()
        v11.backgroundColor = UIColor.blue
        v1.addSubview(v11)
        v11.cv.makeConstraints { (make) in
            make.left.equalTo(v1).offset(10)
            make.top.equalTo(10)
            make.right.equalTo(200)
            make.bottom.equalTo(400)
        }
        
        let v12 = UIView()
        v12.backgroundColor = UIColor.orange
        v1.addSubview(v12)
        v12.cv.makeConstraints { (make) in
            make.left.equalTo(v11.cv.right).offset(10)
            make.top.equalTo(v11.cv.top).offset(10)
            make.right.equalTo(50)
            make.bottom.equalTo(v11.cv.bottom).offset(10)
        }
    }
}

