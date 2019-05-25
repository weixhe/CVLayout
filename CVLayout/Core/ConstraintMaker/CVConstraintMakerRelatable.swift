//
//  CVConstraintMakerRelatable.swift
//  CVLayout
//
//  Created by caven on 2019/5/18.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// Maker 的关系类
public class CVConstraintMakerRelatable {
    
    internal var description: CVConstraintDescription
    
    init(description: CVConstraintDescription) {
        self.description = description
    }
    
    
    
    @discardableResult
    public func equalTo(_ other: CVConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> CVConstraintMakerEditable {
        return self.relatedTo(other, relation: .equal, file: file, line: line)
    }

//    @discardableResult
//    public func equalToSuperview(_ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
//        guard let other = self.description.item.superview else {
//            fatalError("Expected superview but found nil when attempting make constraint `equalToSuperview`.")
//        }
//        return self.relatedTo(other, relation: .equal, file: file, line: line)
//    }

    @discardableResult
    public func lessThanOrEqualTo(_ other: CVConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> CVConstraintMakerEditable {
        return self.relatedTo(other, relation: .lessThanOrEqual, file: file, line: line)
    }

//    @discardableResult
//    public func lessThanOrEqualToSuperview(_ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
//        guard let other = self.description.item.superview else {
//            fatalError("Expected superview but found nil when attempting make constraint `lessThanOrEqualToSuperview`.")
//        }
//        return self.relatedTo(other, relation: .lessThanOrEqual, file: file, line: line)
//    }

    @discardableResult
    public func greaterThanOrEqualTo(_ other: CVConstraintRelatableTarget, _ file: String = #file, line: UInt = #line) -> CVConstraintMakerEditable {
        return self.relatedTo(other, relation: .greaterThanOrEqual, file: file, line: line)
    }

//    @discardableResult
//    public func greaterThanOrEqualToSuperview(_ file: String = #file, line: UInt = #line) -> ConstraintMakerEditable {
//        guard let other = self.description.item.superview else {
//            fatalError("Expected superview but found nil when attempting make constraint `greaterThanOrEqualToSuperview`.")
//        }
//        return self.relatedTo(other, relation: .greaterThanOrEqual, file: file, line: line)
//    }
}

extension CVConstraintMakerRelatable {
    internal func relatedTo(_ other: CVConstraintRelatableTarget, relation: CVLayout.Relation, file: String, line: UInt) -> CVConstraintMakerEditable {
        let related: CVConstraintItem
        let constant: CVConstantTarget
        
        if let other = other as? CVConstraintItem {  // 刚好是item
            related = other
            constant = 0.0
        } else if let other = other as? CVConstraintView { // view
            related = CVConstraintItem(target: other, attributes: CVConstraintAttributes.none)
            constant = 0.0
        } else if let other = other as? CVConstantTarget { // 数值
            related = CVConstraintItem(target: nil, attributes: CVConstraintAttributes.none)
            constant = other
        } else {
            fatalError("无效的约束： (\(file), \(line))")
        }
        
        let editable = CVConstraintMakerEditable(description: self.description)
        editable.description.relation = relation
        editable.description.related = related
        editable.description.constant = constant
        return editable
    }
    
}
