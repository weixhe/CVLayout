//
//  CVOffsetTarget.swift
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
public protocol CVOffsetTarget: CVConstantTarget {
    
}

extension Int: CVOffsetTarget {
}

extension UInt: CVOffsetTarget {
}

extension Float: CVOffsetTarget {
}

extension Double: CVOffsetTarget {
}

extension CGFloat: CVOffsetTarget {
}

extension CVOffsetTarget {
    internal var offsetTargetValue: CGFloat {
        let offset: CGFloat
        if let value = self as? Int {
            offset = CGFloat(value)
        } else if let value = self as? UInt {
            offset = CGFloat(value)
        } else if let value = self as? UInt {
            offset = CGFloat(value)
        } else if let value = self as? Float {
            offset = CGFloat(value)
        } else if let value = self as? Double {
            offset = CGFloat(value)
        } else if let value = self as? CGFloat {
            offset = value
        } else {
            offset = 0.0
        }
        return offset
    }
}
