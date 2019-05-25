//
//  CVLayout.Attribute.swift
//  CVLayout
//
//  Created by caven on 2019/5/7.
//  Copyright © 2019 caventwy. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif


extension CVLayout {
    
    public enum Attribute : Int {
        case left = 1
        case top
        case right
        case bottom
        case width
        case height
        case centerX
        case centerY

    }
    
    
}



