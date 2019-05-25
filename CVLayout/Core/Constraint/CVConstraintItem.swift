//
//  CVLayoutItem.swift
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

/// 布局使用的item， 每一个view 和 view对应的一个或多个属性生成一个item
public final class CVConstraintItem {
    
    internal let target: AnyObject?
    internal let attributes: CVConstraintAttributes
    
    internal init(target: AnyObject?, attributes: CVConstraintAttributes) {
        self.target = target
        self.attributes = attributes
    }
    
    internal var layoutConstraintItem: CVLayoutConstraintItem? {
        return self.target as? CVLayoutConstraintItem
    }
    
}

/// 用户判断两个 ConstraintItem 是否相等
public func ==(lhs: CVConstraintItem, rhs: CVConstraintItem) -> Bool {
    guard lhs !== rhs else {
        return true
    }
    
    guard let target1 = lhs.target,
          let target2 = rhs.target,
        target1 === target2 && lhs.attributes == rhs.attributes else {
            return false
    }
    
    return true
}
