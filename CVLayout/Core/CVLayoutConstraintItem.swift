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
    internal var layouts: [CVLayout] {
        return self.layoutSet.allObjects as! [CVLayout]
    }
    
    /// 添加一个约束
    internal func add(layouts: [CVLayout]) {
        let layoutSet = self.layoutSet
        for layout in layouts {
            layoutSet.add(layout)
        }
    }
    
    /// 删除一个约束
    internal func remove(layouts: [CVLayout]) {
        let layoutSet = self.layoutSet
        for layout in layouts {
            layoutSet.remove(layout)
        }
    }
    
    /// 删除所有的约束
    internal func removeAllLayouts() {
        self.layoutSet.removeAllObjects()
    }
    
    
}

private struct Keys {
    static let constraintsKey: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: "constraintsKey".hashValue)
}
extension CVLayoutConstraintItem {
    private var layoutSet: NSMutableSet {
        let layoutSet: NSMutableSet
        if let exsit = objc_getAssociatedObject(self, Keys.constraintsKey) as? NSMutableSet {
            layoutSet = exsit
        } else {
            layoutSet = NSMutableSet()
            objc_setAssociatedObject(self, Keys.constraintsKey, layoutSet, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return layoutSet
    }
}

