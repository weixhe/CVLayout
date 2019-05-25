//
//  CVConstraintDSL.swift
//  CVLayout
//
//  Created by caven on 2019/5/19.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


public protocol CVConstraintDSL {
    var target: AnyObject? { get }
}

extension CVConstraintDSL {
    public var left: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.left)
    }
    
    public var top: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.top)
    }
    
    public var right: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.right)
    }
    
    public var bottom: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.bottom)
    }
    
    public var width: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.width)
    }
    
    public var height: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.height)
    }
    
    public var centerX: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.centerX)
    }
    
    public var centerY: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.centerY)
    }
    
    public var edges: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.edges)
    }
    
    public var size: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.size)
    }
    
    public var center: CVConstraintItem {
        return CVConstraintItem(target: self.target, attributes: CVConstraintAttributes.center)
    }
}
