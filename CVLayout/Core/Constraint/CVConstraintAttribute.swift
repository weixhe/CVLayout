//
//  CVConstraintAttribute.swift
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


internal struct CVConstraintAttributes : OptionSet, ExpressibleByIntegerLiteral {
    
    typealias IntegerLiteralType = UInt
    
    internal init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    internal init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }
    internal init(nilLiteral: ()) {
        self.rawValue = 0
    }
    internal init(integerLiteral rawValue: IntegerLiteralType) {
        self.init(rawValue: rawValue)
    }
    
    internal private(set) var rawValue: UInt
    internal static var allZeros: CVConstraintAttributes { return 0 }
    internal static func convertFromNilLiteral() -> CVConstraintAttributes { return 0 }
    internal var boolValue: Bool { return self.rawValue != 0 }
    
    internal func toRaw() -> UInt { return self.rawValue }
    internal static func fromRaw(_ raw: UInt) -> CVConstraintAttributes? { return self.init(raw) }
    internal static func fromMask(_ raw: UInt) -> CVConstraintAttributes { return self.init(raw) }
    
    
    internal static var none: CVConstraintAttributes { return 0 }
    internal static var left: CVConstraintAttributes { return 1 }
    internal static var top: CVConstraintAttributes {  return 2 }
    internal static var right: CVConstraintAttributes { return 4 }
    internal static var bottom: CVConstraintAttributes { return 8 }
    internal static var leading: CVConstraintAttributes { return 16 }
    internal static var trailing: CVConstraintAttributes { return 32 }
    internal static var width: CVConstraintAttributes { return 64 }
    internal static var height: CVConstraintAttributes { return 128 }
    internal static var centerX: CVConstraintAttributes { return 256 }
    internal static var centerY: CVConstraintAttributes { return 512 }
    
    
    internal static var edges: CVConstraintAttributes { return 15 }
    internal static var size: CVConstraintAttributes { return 192 }
    internal static var center: CVConstraintAttributes { return 768 }
    
    /** 所有布局的属性数组 */
    internal var layoutAttributes:[CVLayout.Attribute] {
        var attrs = [CVLayout.Attribute]()
        if (self.contains(CVConstraintAttributes.left)) {
            attrs.append(.left)
        }
        if (self.contains(CVConstraintAttributes.top)) {
            attrs.append(.top)
        }
        if (self.contains(CVConstraintAttributes.right)) {
            attrs.append(.right)
        }
        if (self.contains(CVConstraintAttributes.bottom)) {
            attrs.append(.bottom)
        }
        if (self.contains(CVConstraintAttributes.width)) {
            attrs.append(.width)
        }
        if (self.contains(CVConstraintAttributes.height)) {
            attrs.append(.height)
        }
        if (self.contains(CVConstraintAttributes.centerX)) {
            attrs.append(.centerX)
        }
        if (self.contains(CVConstraintAttributes.centerY)) {
            attrs.append(.centerY)
        }
        
        return attrs
    }
}

internal func + (left: CVConstraintAttributes, right: CVConstraintAttributes) -> CVConstraintAttributes {
    return left.union(right)
}

internal func +=(left: inout CVConstraintAttributes, right: CVConstraintAttributes) {
    left.formUnion(right)
}

internal func -=(left: inout CVConstraintAttributes, right: CVConstraintAttributes) {
    left.subtract(right)
}

internal func ==(left: CVConstraintAttributes, right: CVConstraintAttributes) -> Bool {
    return left.rawValue == right.rawValue
}
