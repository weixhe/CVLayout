//
//  Demo5ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/25.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

class Demo5ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "自动计算 label 的宽度高度"
        self.view.backgroundColor = UIColor.white
        
        let label1 = UILabel()
        label1.backgroundColor = UIColor.gray
        label1.text = "欢迎来到北京"
        label1.textColor = UIColor.white
        view.addSubview(label1)
        label1.cv.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(100)
        }
        
        
        let label2 = UILabel()
        label2.backgroundColor = UIColor.gray
        label2.text = "北京大学（Peking University），简称“北大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、京港大学联盟、亚洲大学联盟、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、21世纪学术联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟成员。"
        
        label2.textColor = UIColor.white
        label2.numberOfLines = 0
        view.addSubview(label2)
        label2.cv.makeConstraints { (make) in
            make.left.right.equalTo(10)
            make.top.equalTo(label1.cv.bottom).offset(10)            
        }
        
    }

}
