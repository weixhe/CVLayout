//
//  CVConstraint.swift
//  CVLayout
//
//  Created by caven on 2019/5/7.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


/// 约束类， 约束了 item 与 item 之间的关系，对应的数值, 优先级
/// 每一条 make 语句都是一条约束
public final class CVConstraint {
    
    private var from: CVConstraintItem
    private var to: CVConstraintItem
    /** 对应的关系 */
    private var relation: CVLayout.Relation
    /** 对应的倍数 */
    private var multiplier: CVMultiplierTarget
    /** 设置约束的数值，后期可以更新 */
    private var constant: CVConstantTarget
//    {
//        didSet {
//            self.updateConstant()
//        }
//    }

    private var file: StaticString = #file
    private var line: UInt = #line
    
    /** 存储所有的layout */
    public var layouts: [CVLayout]
    
    /// 初始化
    internal init(from: CVConstraintItem,
                  to: CVConstraintItem,
                  relation: CVLayout.Relation,
                  multiplier: CVMultiplierTarget,
                  constant: CVConstantTarget,
                  file: StaticString = #file,
                  line: UInt = #line) {
        
        self.file = file
        self.line = line
        
        self.from = from
        self.to = to
        self.relation = relation
        self.multiplier = multiplier
        self.constant = constant
        self.layouts = []
        
        let fromAttributes = self.from.attributes.layoutAttributes
        let toAttributes = self.to.attributes.layoutAttributes
        
        
        // 1. 取 from item
        let fromItem = self.from.layoutConstraintItem as! CVConstraintView
        
        // 2. 取 关系 relation
        let layoutRelation = self.relation
        
        // 过滤 from attribute
        for fromAttribute in fromAttributes {
            
            // 针对每一个 from attribute 查找对应的to attribute
            let toAttribute: CVLayout.Attribute
            if toAttributes.count > 0 {  // 有to item
                if self.from.attributes == .edges {
                    switch fromAttribute {
                    case .top:
                        toAttribute = .top
                    case .left:
                        toAttribute = .left
                    case .bottom:
                        toAttribute = .bottom
                    case .right:
                        toAttribute = .right
                    default:
                        fatalError()
                    }
                } else if self.from.attributes == self.to.attributes {
                    toAttribute = fromAttribute
                } else {
                    toAttribute = toAttributes[0]
                }
            } else {  // 没有to item没有attribute， 则默认取from的父类
                if self.to.target == nil && (fromAttribute == .centerX || fromAttribute == .centerY) {
                    toAttribute = fromAttribute // == .centerX ? .left : .top
                } else {
                    toAttribute = fromAttribute
                }
            }
            
            // 3. 取对应的数值
            let layoutConstant: CGFloat = self.constant.constrantTargetFor(layoutAttribute: toAttribute)
            let layoutMultiplier: CGFloat = self.multiplier.multiplierTargetValue
            
            // 4. 取 to item
            var toItem: CVConstraintView? = self.to.layoutConstraintItem as? CVConstraintView
            if toItem == nil && toAttribute != .width && toAttribute != .height {
                toItem = fromItem.superview  // 如果to item为nil，则使用父类view
            }
            
            // 所有的数据都已取完，开始正式创建一条约束
            let layout = CVLayout(from: fromItem,
                                  fromAttribute: fromAttribute,
                                  relation: layoutRelation,
                                  to: toItem,
                                  toAttribute: toAttribute,
                                  multiplier: layoutMultiplier,
                                  constant: layoutConstant,
                                  file: file,
                                  line: line)
            
            // 将这一条约束存储起来
            self.layouts.append(layout)
        }
    }
}

extension CVConstraint {
    /// 更新约束的数值和优先级
    internal func updateConstant() {
        for layout in self.layouts {
            let attribute = layout.toAttribute == .none ? layout.fromAttribute : layout.toAttribute
            layout.constant = self.constant.constrantTargetFor(layoutAttribute: attribute)
        }
    }
    
    /// 激活约束，在需要的情况下, updatingExisting: 更新或者新增
//    internal class func activateIfNeeded(updatingExisting: Bool = false) {
//        guard let item = self.from.layoutConstraintItem else {
//            fatalError("警告：没有找到需要约束的view，该约束无效", file: file, line: line)
//        }
//
//        // 更新from item 上的所有的layout
//        let layouts = self.layouts
//
//        if updatingExisting {
//            // 用来存储已存在的layout
//            var existLayouts: [CVLayout] = []
//
//            // 先取出现有的约束
//            if let view = item as? CVConstraintView {
//                for constraint in view.cv.constraints {
//                    existLayouts += constraint.layouts
//                }
//            }
//
//            // 遍历 layouts 数组，
//            for layout in self.layouts {
//                let existingLayout = existLayouts.first { $0 == layout }
//                // 判断 existingLayout 是否存在
//                guard let updateLayout = existingLayout else {
//                    fatalError("警告: 约束 \(layout) 不存在", file: file, line: line)
//                }
//
//                let updateLayoutAttribute = (updateLayout.toAttribute == .none) ? updateLayout.fromAttribute : updateLayout.toAttribute
//
//                updateLayout.constant = self.constant.constrantTargetFor(layoutAttribute: updateLayoutAttribute)
//            }
//
//        } else {
//
//            CVLayout.activate(layouts)
//            if let view = item as? CVConstraintView {
////                view.cv.constraints.removeAll()
//                view.cv.add(constraints: [self])
//            }
//        }
//    }
    
//    /// 禁用约束，在需要的条件下
//    internal func deactivateIfNeeded() {
//        guard let item = self.from.layoutConstraintItem else {
//            fatalError("警告：没有找到需要约束的view，该取消约束无效", file: file, line: line)
//        }
//        let layouts = self.layouts
//        CVLayout.deactivate(layouts)
//        item.remove(constraints: [self])
//    }
}
