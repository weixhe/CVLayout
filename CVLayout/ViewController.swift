//
//  ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/7.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataSource: [String] = ["测试 left, top, right, bottom, offset",
                                "测试 edges，size",
                                "测试 width， height, multiplied",
                                "测试 centerX  centerY  center",
                                "自动计算 label 的宽度高度",
                                "自动计算 label 的宽度高度(富文本)"]
    let classSource: [String] = ["Demo1ViewController",
                                 "Demo2ViewController",
                                 "Demo3ViewController",
                                 "Demo4ViewController",
                                 "Demo5ViewController",
                                 "Demo6ViewController"]

    lazy var tableView: UITableView = {
        
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        self.tableView.cv.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell!.accessoryType = .disclosureIndicator
        }
        
        if indexPath.row < self.dataSource.count {
            cell!.textLabel?.text = self.dataSource[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cls = NSObject.swiftClassFromString(className: self.classSource[indexPath.row]) as! UIViewController.Type
        let vc = cls.init()
        
        self.navigationController?.pushViewController(vc , animated: true)
    }
}





extension NSObject {
    class func swiftClassFromString(className: String) -> AnyClass! {
        if  let appName: String = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
            let classStringName = appName + "." + className
            return NSClassFromString(classStringName)
        }
        return nil;
    }
}
