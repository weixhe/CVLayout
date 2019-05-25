//
//  Demo6ViewController.swift
//  CVLayout
//
//  Created by caven on 2019/5/25.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

class Demo6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        self.title = "自动计算 label 的宽度高度(富文本)"
        self.view.backgroundColor = UIColor.white
        
        let txt3 = "欢迎来到北京-北京欢迎你"
        let label3 = UILabel()
        label3.backgroundColor = UIColor.gray
        label3.textColor = UIColor.white
        view.addSubview(label3)
        
        let label3_attri = NSMutableAttributedString(string: txt3)
        label3_attri.addAttribute(.kern, value: 15, range: NSRange(location: 0, length: txt3.count))
        let label3_para = NSMutableParagraphStyle()
        label3_para.lineSpacing = 30
        label3.attributedText = label3_attri
        label3_attri.addAttribute(.paragraphStyle, value: label3_para, range: NSRange(location: 0, length: txt3.count))
        
        label3.cv.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(100)
        }
        
        
        let txt4 =  "北京大学（Peking University），简称“北大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、京港大学联盟、亚洲大学联盟、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、21世纪学术联盟、东亚四大学论坛、国际公立大学论坛、中俄综合性大学联盟成员。"
        let label4 = UILabel()
        label4.backgroundColor = UIColor.gray
        
        let label4_attri = NSMutableAttributedString(string: txt4)
        label4_attri.addAttribute(.kern, value: 4, range: NSRange(location: 0, length: txt4.count))
        let label4_para = NSMutableParagraphStyle()
        label4_para.lineSpacing = 5
        label4_attri.addAttribute(.paragraphStyle, value: label4_para, range: NSRange(location: 0, length: txt4.count))
        label4.attributedText = label4_attri
        
        label4.textColor = UIColor.white
        label4.numberOfLines = 0
        view.addSubview(label4)
        label4.cv.makeConstraints { (make) in
            make.left.right.equalTo(10)
            make.top.equalTo(label3.cv.bottom).offset(10)
        }

    }
    

}
