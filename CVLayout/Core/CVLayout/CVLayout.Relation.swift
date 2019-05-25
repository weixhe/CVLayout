//
//  CVLayout.Relation.swift
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


extension CVLayout {
    
    internal enum Relation : Int {
        case equal = 1
        case lessThanOrEqual
        case greaterThanOrEqual
    }
}
