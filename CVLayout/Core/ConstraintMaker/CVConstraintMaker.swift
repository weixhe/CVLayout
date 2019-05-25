//
//  CVConstraintMaker.swift
//  CVLayout
//
//  Created by caven on 2019/5/7.
//  Copyright © 2019 caventwy. All rights reserved.
//

import UIKit

public class CVConstraintMaker {
    
    public var left: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.left)
    }

    public var top: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.top)
    }

    public var bottom: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.bottom)
    }

    public var right: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.right)
    }

    public var width: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.width)
    }

    public var height: CVConstraintMarkerAttribute {
        
        return self.makeExtendableWithAttribute(.height)
    }

    public var centerX: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.centerX)
    }

    public var centerY: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.centerY)
    }

    public var edges: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.edges)
    }
    
    public var size: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.size)
    }
    
    public var center: CVConstraintMarkerAttribute {
        return self.makeExtendableWithAttribute(.center)
    }
    
    private let item: CVLayoutConstraintItem
    
    private var description: [CVConstraintDescription] = []
    
    /// 初始化方法，保存需要布局的item
    internal init(item: CVLayoutConstraintItem) {
        self.item = item
        if let view = item as? CVConstraintView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    

    internal class func makeConstraints(item: CVLayoutConstraintItem, file: StaticString = #file, line: UInt = #line, closure: (_ maker: CVConstraintMaker) -> Void) {
        
        let constraints = self.prepareConsraint(item: item, file: file, line: line, closure: closure)
        // 遍历所有的约束，并更新这个约束
        var allLayout: [CVLayout] = []
        for constraint in constraints {
            allLayout += constraint.layouts
        }
        
        CVLayout.activate(allLayout)
//        if let view = item as? CVConstraintView {
//            view.removeAllLayouts()
//            view.add(layouts: allLayout)
//        }
    }
    
//    internal class func updateConstraints(file: StaticString = #file, line: UInt = #line) {
//        if let view = item as? CVConstraintView {
//            CVLayout.activate(view.layouts)
//        }
//    }
//
//    internal class func updateConstraints(file: StaticString = #file, line: UInt = #line, _ closure: (_ make: CVConstraintMaker) -> Void) {
//
//    }
}

extension CVConstraintMaker {
    
    private class func prepareConsraint(item: CVLayoutConstraintItem, file: StaticString = #file, line: UInt = #line, closure: (_ maker: CVConstraintMaker) -> Void) -> [CVConstraint] {
        
        let maker = CVConstraintMaker(item: item)
        closure(maker)
        
        // 遍历Maker的attributes，并创建每一个Constraint
        var constraints: [CVConstraint] = []
        for description in maker.description {
            description.file = file
            description.line = line
            guard let constraint = description.constraint else {
                continue
            }
            constraints.append(constraint)
        }
        return constraints
    }
    
    /// 添加left，right等属性，并根据每一条属性创建一条约束描述
    private func makeExtendableWithAttribute(_ attributtes: CVConstraintAttributes) -> CVConstraintMarkerAttribute {

        let description = CVConstraintDescription(item: item, attributes: attributtes)
        self.description.append(description)
        
        
        return CVConstraintMarkerAttribute(description: description)
    }
}
