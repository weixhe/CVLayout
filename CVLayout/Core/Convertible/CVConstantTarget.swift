//
//  CVConstantTarget.swift
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
public protocol CVConstantTarget {
    
}

extension CGSize: CVConstantTarget {
    
}

extension CGPoint: CVConstantTarget {
    
}

extension UIEdgeInsets: CVConstantTarget {

}

extension CVConstantTarget {
    internal func constrantTargetFor(layoutAttribute: CVLayout.Attribute) -> CGFloat {
        if let value = self as? Float {
            return CGFloat(value)
        }
        
        if let value = self as? CGFloat {
            return value
        }
        
        if let value = self as? Int {
            return CGFloat(value)
        }
        
        if let value = self as? Double {
            return CGFloat(value)
        }
        
        if let value = self as? UInt {
            return CGFloat(value)
        }
        
        if let value = self as? UInt8 {
            return CGFloat(value)
        }
        
        if let value = self as? NSInteger {
            return CGFloat(value)
        }
        
        if let value = self as? NSNumber {
            return CGFloat(value.doubleValue)
        }
        
        if let value = self as? CGSize {
            if layoutAttribute == .width {
                return value.width
            } else if layoutAttribute == .height {
                return value.height
            } else {
                return 0.0
            }
        }
        
        if let value = self as? CGPoint {
            switch layoutAttribute {
            case .left, .right, .centerX:
                return value.x
            case .top, .bottom, .centerY:
                return value.y
            default:
                return 0.0
            }
        }
        
        if let value = self as? UIEdgeInsets {
            switch layoutAttribute {
            case .left, .centerX:
                return value.left
            case .top:
                return value.top
            case .right, .centerY:
                return -value.right
            case .bottom:
                return -value.bottom
            case .width:
                return -(value.left + value.right)
            case .height:
                return -(value.top + value.bottom)
            }
        }
        return 0.0
    }
}
