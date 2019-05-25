//
//  Demo3ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/24.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit


class Demo3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "测试 width， height"
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.blue
        view.addSubview(v1)
        v1.cv.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(100)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.orange
        view.addSubview(v2)
        v2.cv.makeConstraints { (make) in
            make.left.equalTo(v1).offset(0)
            make.top.equalTo(v1.cv.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        let v21 = UIView()
        v21.backgroundColor = UIColor.red
        v2.addSubview(v21)
        v21.cv.makeConstraints { (make) in
            make.left.equalTo(v2).offset(0)
            make.top.equalTo(v2).offset(10)
            make.width.height.equalTo(v2).multipliedBy(0.5)
        }
        
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.red
        view.addSubview(v3)
        v3.cv.makeConstraints { (make) in
            make.left.equalTo(v2.cv.right).offset(10)
            make.top.equalTo(v2)
            make.width.height.equalTo(50)
        }
        

    }
    


}
