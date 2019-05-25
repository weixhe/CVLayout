//
//  CVConstraintPriority.swift
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

/// 定义约束的优先级 - 结构体
public struct CVConstraintPriority: ExpressibleByFloatLiteral, Equatable, Strideable {
    
    public typealias FloatLiteralType = Float
    
    public var value: Float
    
    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    public init(_ value: Float) {
        self.value = value
    }
    
    /** 定义一个要求的优先级 */
    public static var required: CVConstraintPriority {
        return 1000.0
    }
    
    /** 定义一个高优先级 */
    public static var high: CVConstraintPriority {
        return 750.0
    }
    
    /** 定义一个中间级优先级 */
    public static var medium: CVConstraintPriority {
        #if os(OSX)
        return 501.0
        #else
        return 500.0
        #endif
    }
    
    /** 定义一个低优先级 */
    public static var low: CVConstraintPriority {
        return 250.0
    }
    
    
    public static func ==(lhs: CVConstraintPriority, rhs: CVConstraintPriority) -> Bool {
        return lhs.value == rhs.value
    }
    
    // MARK: Strideable
    
    public func advanced(by n: FloatLiteralType) -> CVConstraintPriority {
        return CVConstraintPriority(floatLiteral: value + n)
    }
    
    public func distance(to other: CVConstraintPriority) -> FloatLiteralType {
        return other.value - value
    }
}



