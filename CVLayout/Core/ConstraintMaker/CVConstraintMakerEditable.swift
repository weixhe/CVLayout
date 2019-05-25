//
//  CVConstraintMakerEditable.swift
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

/// 本类用来设置约束的具体数值
public class CVConstraintMakerEditable {
    
    internal var description: CVConstraintDescription
    
    init(description: CVConstraintDescription) {
        self.description = description
    }
    
    
    
    @discardableResult
    public func multipliedBy(_ amount: CVMultiplierTarget) -> CVConstraintMakerEditable {
        self.description.multiplier = amount.multiplierTargetValue
        return self
    }

    @discardableResult
    public func dividedBy(_ amount: CVMultiplierTarget) -> CVConstraintMakerEditable {
        return self.multipliedBy(1.0 / amount.multiplierTargetValue)
    }

    @discardableResult
    public func offset(_ amount: CVOffsetTarget) -> CVConstraintMakerEditable {
        self.description.constant = amount.offsetTargetValue
        return self
    }

    @discardableResult
    public func inset(_ amount: CVInsetTarget) -> CVConstraintMakerEditable {
        self.description.constant = amount.insetTargetValue
        return self
    }
    
}
