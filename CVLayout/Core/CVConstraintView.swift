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


