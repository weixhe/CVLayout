//
//  CVInsetTarget.swift
//  CVLayout
//
//  Created by caven on 2019/5/12.
//  Copyright © 2019 caventwy. All rights reserved.
//


#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 常数（数值） - target
public protocol CVInsetTarget: CVConstantTarget {
    
}

extension Int: CVInsetTarget {
}

extension UInt: CVInsetTarget {
}

extension Float: CVInsetTarget {
}

extension Double: CVInsetTarget {
}

extension CGFloat: CVInsetTarget {
}

extension CVConstraintInsets: CVInsetTarget {
}

extension CVInsetTarget {
    internal var insetTargetValue: CVConstraintInsets {
        let inset: CVConstraintInsets
        if let value = self as? CVConstraintInsets {
            inset = value
        } else if let value = self as? UInt {
            let ff = CGFloat(value)
            inset = CVConstraintInsets(top: ff, left: ff, bottom: ff, right: ff);
        } else if let value = self as? UInt {
            let ff = CGFloat(value)
            inset = CVConstraintInsets(top: ff, left: ff, bottom: ff, right: ff);
        } else if let value = self as? Float {
            let ff = CGFloat(value)
            inset = CVConstraintInsets(top: ff, left: ff, bottom: ff, right: ff);
        } else if let value = self as? Double {
            let ff = CGFloat(value)
            inset = CVConstraintInsets(top: ff, left: ff, bottom: ff, right: ff);
        } else if let value = self as? CGFloat {
            let ff = value
            inset = CVConstraintInsets(top: ff, left: ff, bottom: ff, right: ff);
        } else {
            inset = CVConstraintInsets.zero
        }
        return inset
    }
}
