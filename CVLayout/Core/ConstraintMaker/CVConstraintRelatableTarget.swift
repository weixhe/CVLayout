//
//  CVConstraintRelatableTarget.swift
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


/// ConstraintMaker使用的 关系-对象
public protocol CVConstraintRelatableTarget {
    
}


extension Int: CVConstraintRelatableTarget {
}

extension UInt: CVConstraintRelatableTarget {
}

extension Float: CVConstraintRelatableTarget {
}

extension Double: CVConstraintRelatableTarget {
}

extension CGFloat: CVConstraintRelatableTarget {
}

extension CGSize: CVConstraintRelatableTarget {
}

extension CGPoint: CVConstraintRelatableTarget {
}

extension CVConstraintInsets: CVConstraintRelatableTarget {
}

extension CVConstraintItem: CVConstraintRelatableTarget {
}

extension CVConstraintView: CVConstraintRelatableTarget {
}


