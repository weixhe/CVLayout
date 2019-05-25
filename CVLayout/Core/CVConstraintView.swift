//
//  CVConstraintView.swift
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

import Foundation


/// 给UIView 和 NSView 取一个公用的名字

#if os(iOS) || os(tvOS)
public typealias CVConstraintView = UIView
#else
public typealias CVConstraintView = NSView
#endif

#if os(iOS) || os(tvOS)
public typealias CVConstraintInsets = UIEdgeInsets
#else
public typealias CVConstraintInsets = NSEdgeInsets
#endif

/*
extension UIApplication {
    private static let runOnce: Void = {
        CVConstraintView.CVConstraintViewOnce()
//        UIViewController.UIViewControllerOnce()

    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
    
}

extension CVConstraintView {
    static func CVConstraintViewOnce() {
        
        let originalMethod = class_getInstanceMethod(self, #selector(layoutSubviews))
        let swizzledMethod = class_getInstanceMethod(self, #selector(cv_layoutSubviews))

        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        if class_addMethod(self, #selector(layoutSubviews), method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(self, #selector(cv_layoutSubviews), method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }

    }
    
    @objc func cv_layoutSubviews() {
        cv_layoutSubviews()
        if self.layouts.count > 0 {
            CVLayout.activate(self.layouts)
        }
    }
    
}
*/
