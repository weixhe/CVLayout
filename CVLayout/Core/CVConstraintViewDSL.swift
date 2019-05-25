//
//  CVConstraintViewDSL.swift
//  CVLayout
//
//  Created by caven on 2019/5/18.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


public struct CVConstraintViewDSL: CVConstraintDSL {
    
    public func makeConstraints(file: StaticString = #file, line: UInt = #line, _ closure: (_ make: CVConstraintMaker) -> Void) {
        CVConstraintMaker.makeConstraints(item: self.view, file: file, line: line, closure: closure)
    }
    
    public func updateConstraints(file: StaticString = #file, line: UInt = #line, _ closure: (_ make: CVConstraintMaker) -> Void) {
//        CVConstraintMaker.makeConstraints(item: self.view, file: file, line: line, closure: closure)
    }
    
    public var target: AnyObject? {
        return self.view
    }
    
    internal let view: CVConstraintView
    
    internal init(view: CVConstraintView) {
        self.view = view
    }
}


extension CVConstraintView {
    public var cv: CVConstraintViewDSL {
        return CVConstraintViewDSL(view: self)
    }
}

