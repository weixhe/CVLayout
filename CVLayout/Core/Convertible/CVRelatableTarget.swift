//
//  CVRelatableTarget.swift
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

/// 关系 - target
public protocol CVRelatableTarget {
    
}

extension CVRelatableTarget {
    func value() -> CGFloat {
        if let value = self as? CGFloat {
            return value
        }
        
        if let value = self as? Float {
            return CGFloat(value)
        }
        
        if let value = self as? Double {
            return CGFloat(value)
        }
        
        if let value = self as? Int {
            return CGFloat(value)
        }
        
        if let value = self as? UInt {
            return CGFloat(value)
        }
        
        return 0.0
    }
}

extension UIView : CVRelatableTarget {
    
    
}

extension Int : CVRelatableTarget {
}

extension UInt: CVRelatableTarget {
}

extension Float: CVRelatableTarget {
}

extension Double: CVRelatableTarget {
}

extension CGFloat: CVRelatableTarget {
}

extension CGSize: CVRelatableTarget {
}

extension CGPoint: CVRelatableTarget {
}

extension UIEdgeInsets: CVRelatableTarget {
}

//extension ConstraintItem: CVRelatableTarget {
//}
