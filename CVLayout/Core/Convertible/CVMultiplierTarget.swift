//
//  CVMultiplierTarget.swift
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

/// 倍数 - target
public protocol CVMultiplierTarget {
    
    var multiplierTargetValue: CGFloat { get }
    
}

extension Int: CVMultiplierTarget {
    
    public var multiplierTargetValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt: CVMultiplierTarget {
    
    public var multiplierTargetValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension Float: CVMultiplierTarget {
    
    public var multiplierTargetValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension Double: CVMultiplierTarget {
    
    public var multiplierTargetValue: CGFloat {
        return CGFloat(self)
    }
    
}

extension CGFloat: CVMultiplierTarget {
    
    public var multiplierTargetValue: CGFloat {
        return self
    }
    
}
