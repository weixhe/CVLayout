//
//  CVConstraintDescription.swift
//  CVLayout
//
//  Created by caven on 2019/5/19.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 本类是中间类，负责生成一条约束（CVConstraint），在Maker中创建，并在Attribute和其父类Relatable中更新
public class CVConstraintDescription {

    /** 需要布局的对象 */
    internal let item: CVLayoutConstraintItem
    /** 需要布局的对象的某个属性 */
    internal var attributes: CVConstraintAttributes
    /** 对应的关系 */
    internal var relation: CVLayout.Relation? = nil
    /** 被关联的对象和属性 */
    internal var related: CVConstraintItem? = nil
    /** 对应的倍数 */
    internal var multiplier: CVMultiplierTarget = 1.0
    /** 设置约束的数值 */
    internal var constant: CVConstantTarget = 0.0
    
    internal var file: StaticString = #file
    internal var line: UInt = #line
    
    /** 生成一条约束 */
    internal lazy var constraint: CVConstraint? = {
        guard let relation = self.relation, let related = self.related else {
                return nil
        }
        let from = CVConstraintItem(target: self.item, attributes: self.attributes)
        return CVConstraint(from: from,
                            to: related,
                            relation: relation,
                            multiplier: self.multiplier,
                            constant: self.constant,
                            file: self.file,
                            line: self.line)
    }()
    
    
    
    // MARK: Initialization
    
    internal init(item: CVLayoutConstraintItem, attributes: CVConstraintAttributes) {
        self.item = item
        self.attributes = attributes
    }
    
}
