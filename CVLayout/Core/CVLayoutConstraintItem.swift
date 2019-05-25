//
//  CVLayoutConstraintItem.swift
//  CVLayout
//
//  Created by caven on 2019/5/11.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public protocol CVLayoutConstraintItem: class {
    
}

extension CVConstraintView: CVLayoutConstraintItem {
    
}

extension CVLayoutConstraintItem {
    
    /** 返回 item 的所有约束，只读属性 */
    internal var constraints: [CVConstraint] {
        return self.constraintsSet.allObjects as! [CVConstraint]
    }
    
    /** 返回需要 item 的父类 */
    internal var superview: CVConstraintView? {
        if let view = self as? CVConstraintView {
            return view.superview
        }
        return nil
    }
    
    /// 准备工作，在调用约束之前调用
    internal func prepare() {
        if let view = self as? CVConstraintView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    /// 移除一个约束
    internal func add(constraints: [CVConstraint]) {
        let constraintsSet = self.constraintsSet
        for constraint in constraints {
            constraintsSet.add(constraint)
        }
    }
    
    /// 添加一个约束
    internal func remove(constraints: [CVConstraint]) {
        let constraintsSet = self.constraintsSet
        for constraint in constraints {
            constraintsSet.remove(constraint)
        }
    }
    
}

private struct Keys {
    static let constraintsKey: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "constraintsKey".hashValue)
//    static let fixedWidthKey: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "fixedWidthKey".hashValue)
//    static let fixedHeightKey: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "fixedHeightKey".hashValue)
}
extension CVLayoutConstraintItem {
    
    
    /** 存储所有的的约束，使用 set，避免重复 */
    private var constraintsSet: NSMutableSet {
        let constraintsSet: NSMutableSet
        if let existing = objc_getAssociatedObject(self, Keys.constraintsKey) as? NSMutableSet {
            constraintsSet = existing
        } else {
            constraintsSet = NSMutableSet()
            objc_setAssociatedObject(self, Keys.constraintsKey, constraintsSet, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return constraintsSet
    }
    
//    var fixedWidth: Bool {
//        set {
//            objc_setAssociatedObject(self, Keys.fixedWidthKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        get {
//            if let existing = objc_getAssociatedObject(self, Keys.fixedWidthKey) as? Bool {
//                return existing
//            }
//            return false
//        }
//
//    }
//    var fixedHeight: Bool {
//        set {
//            objc_setAssociatedObject(self, Keys.fixedHeightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        get {
//            if let existing = objc_getAssociatedObject(self, Keys.fixedHeightKey) as? Bool {
//                return existing
//            }
//            return false
//        }
//    }
}

