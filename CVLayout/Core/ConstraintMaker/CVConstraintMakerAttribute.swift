//
//  CVConstraintMakerAttribute.swift
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

/// Maker 的属性类，该类继承自Relatable类，方便在属性之后直接调用 equale 方法等等
public class CVConstraintMarkerAttribute: CVConstraintMakerRelatable {
    public var left: CVConstraintMarkerAttribute {
        self.description.attributes += .left
        return self
    }
    
    public var top: CVConstraintMarkerAttribute {
        self.description.attributes += .top
        return self
    }
    
    public var bottom: CVConstraintMarkerAttribute {
        self.description.attributes += .bottom
        return self
    }
    
    public var right: CVConstraintMarkerAttribute {
        self.description.attributes += .right
        return self
    }
    
    public var leading: CVConstraintMarkerAttribute {
        self.description.attributes += .leading
        return self
    }
    
    public var trailing: CVConstraintMarkerAttribute {
        self.description.attributes += .trailing
        return self
    }
    
    public var width: CVConstraintMarkerAttribute {
        self.description.attributes += .width
        return self
    }
    
    public var height: CVConstraintMarkerAttribute {
        self.description.attributes += .height
        return self
    }
    
    public var centerX: CVConstraintMarkerAttribute {
        self.description.attributes += .centerX
        return self
    }
    
    public var centerY: CVConstraintMarkerAttribute {
        self.description.attributes += .centerY
        return self
    }
    
    public var edges: CVConstraintMarkerAttribute {
        self.description.attributes += .edges
        return self
    }
    public var size: CVConstraintMarkerAttribute {
        self.description.attributes += .size
        return self
    }
    
    public var center: CVConstraintMarkerAttribute {
        self.description.attributes += .center
        return self
    }
}
