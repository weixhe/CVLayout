//
//  CVLayout.swift
//  CVLayout
//
//  Created by caven on 2019/5/12.
//  Copyright © 2019 caventwy. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

/// 约束类， 约束了 item 与 item 之间的关系，对应的数值, 优先级
/// 每一条 make 语句都是一条约束
public final class CVLayout {
    
    internal var from: CVConstraintView
    internal var fromAttribute: Attribute
    
    internal var relation: Relation              // 对应的关系
    
    internal var to: CVConstraintView?
    internal var toAttribute: Attribute
    
    internal var multiplier: CGFloat     // 对应的倍数
    internal var constant: CGFloat       // 对应的数值
    
    /// 初始化
    internal init(from: CVConstraintView,
                  fromAttribute: Attribute,
                  relation: Relation,
                  to: CVConstraintView?,
                  toAttribute: Attribute,
                  multiplier: CGFloat,
                  constant: CGFloat,
                  file: StaticString = #file,
                  line: UInt = #line) {
        
        
        guard from.superview != nil else {
            fatalError("错误：from view 必须先add到父视图上", file: file, line: line)
        }
        if (fromAttribute != .width && fromAttribute != .height) {
            if to == nil {
                fatalError("错误：在设置[top, left, bottom, right, centerX, centerY]时，to view 不能为空", file: file, line: line)
            } else if from.superview! != to && to!.superview == nil {
                fatalError("错误：to view 必须先add到父视图上", file: file, line: line)
            }
        }

        self.from = from
        self.fromAttribute = fromAttribute
        self.relation = relation
        self.to = to
        self.toAttribute = toAttribute
        self.multiplier = multiplier
        self.constant = constant
    }
}

extension CVLayout {

    internal class func activate(_ layouts: [CVLayout]) {
        
        if layouts.count == 0 {
            return
        }
        let view: CVConstraintView = layouts.first!.from
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
       
        let needLayoutAttributes: [Attribute] = layouts.map({ return $0.fromAttribute })
        
        let allWidthArr = layouts.filter({ return $0.toAttribute == .width })
        let allHeightArr = layouts.filter({ return $0.toAttribute == .height })
        var fixedHeight: Bool = false
        var fixedWidth: Bool = false
        if allWidthArr.count > 0 {
            width = layout_width(allWidthArr.last!)
            fixedWidth = true
        }
        if allHeightArr.count > 0 {
            height = layout_height(allHeightArr.last!)
            fixedHeight = true
        }

        for layout in layouts {
            
            guard view == layout.from else { continue }
            switch layout.fromAttribute {
            case .top:
                let value = layout_value(layout)
                if fixedHeight {
                    // 在定height的情况下，优先级从高到低：centerY，bottom，top
                    if needLayoutAttributes.contains(.centerY) || needLayoutAttributes.contains(.bottom) {
                        break
                    } else {
                        y = value
                    }
                } else {
                    y = value
                }
            case .left:
                let value = layout_value(layout)
                if fixedWidth {
                    // 在定height的情况下，优先级从高到低：centerX，right，left
                    if needLayoutAttributes.contains(.centerX) || needLayoutAttributes.contains(.right) {
                        break
                    } else {
                        x = value
                    }
                } else {
                    x = value
                }
            case .bottom:
                let value = layout_value(layout)
                if fixedHeight {
                    // 在定height的情况下，优先级从高到低：centerY，bottom，top
                    if needLayoutAttributes.contains(.centerY) {
                        break
                    } else {
                        y = value - height
                    }
                } else {
                    height = value - y
                }
                
            case .right:
                let value = layout_value(layout)
                if fixedWidth {
                    // 在定height的情况下，优先级从高到低：centerX，right，left
                    if needLayoutAttributes.contains(.centerX) {
                        break
                    } else {
                        x = value - width
                    }
                } else {
                    width = value - x
                }
            case .centerX:
                let value = layout_value(layout)
                if fixedWidth {
                    x = value - width / 2
                } else {
                    width = value - x
                }
            case .centerY:
                let value = layout_value(layout)
                if fixedHeight {
                    y = value - height / 2
                } else {
                    height = value - y
                }
            default:
                break
            }
        }
        
        // 布局完成以后，检查是否有宽度、高度，如果没有，检查是否是label，
        // 如果是label，则需要自动计算宽度或者高度
        
        // 最终结果，将frame设置到view上
        view.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    internal class func deactivate(_ layouts: [CVLayout]) {
        
    }
}

extension CVLayout {
    private class func layout_value(_ layout: CVLayout) -> CGFloat {
        var value: CGFloat = 0.0
        let toView = layout.to
        
//        to view 是父类，使用bounds，如果是兄弟类，则使用frame，其他无关系类，break
        
        if layout.toAttribute == .width || layout.toAttribute == .height {
            if layout.toAttribute == .width {
                if toView != nil {
                    value = toView!.bounds.width * layout.multiplier + layout.constant
                } else {
                    value = layout.constant
                }
                
            } else if layout.toAttribute == .height {
                if toView != nil {
                    value = toView!.bounds.height * layout.multiplier + layout.constant
                } else {
                    value = layout.constant
                }
            }
        } else {
            let frame: CGRect
            if layout.from.superview! == toView! { // to 是 from 的父类
                frame = toView!.bounds
            } else if layout.from.superview! == toView!.superview! { // from和to是兄弟类，即拥有同一个父类
                frame = toView!.frame
            } else {
                print("警告：from view 和 to view 没有任何的关系，约束条件无效")
                return value
            }
            
            if layout.toAttribute == .top {
                value = frame.minY * layout.multiplier + layout.constant
                
            } else if layout.toAttribute == .bottom {
                if layout.fromAttribute == .bottom {
                    value = frame.maxY * layout.multiplier - layout.constant
                } else {
                    value = frame.maxY * layout.multiplier + layout.constant
                }
                
            } else if layout.toAttribute == .left {
                value = frame.minX * layout.multiplier + layout.constant
                
            } else if layout.toAttribute == .right {
                if layout.fromAttribute == .right {
                    value = frame.maxX * layout.multiplier - layout.constant
                } else {
                    value = frame.maxX * layout.multiplier + layout.constant
                }
                
            } else if layout.toAttribute == .centerX {
                value = frame.midX * layout.multiplier + layout.constant
                
            } else if layout.toAttribute == .centerY {
                value = frame.midY * layout.multiplier + layout.constant
                
            }
        }
        
        return value
    }
    
    private class func layout_width(_ layout: CVLayout) -> CGFloat {
        var width: CGFloat = 0.0
        if let view2 = layout.to {
            if layout.toAttribute == .width {
                width = view2.bounds.width * layout.multiplier + layout.constant
            } else if layout.toAttribute == .height {
                width = view2.bounds.height * layout.multiplier + layout.constant
            }
        } else {
            width = layout.constant
        }
        return width
    }
    
    private class func layout_height(_ layout: CVLayout) -> CGFloat {
        var height: CGFloat = 0.0
        if let view2 = layout.to {
            if layout.toAttribute == .width {
                height = view2.bounds.width * layout.multiplier + layout.constant
            } else if layout.toAttribute == .height {
                height = view2.bounds.height * layout.multiplier + layout.constant
            }
        } else {
            height = layout.constant
        }
        return height
    }
}

/// 判断两个layout是否相同
internal func ==(lhs: CVLayout, rhs: CVLayout) -> Bool {
    guard lhs.from === rhs.from &&
        lhs.to === rhs.to &&
        lhs.fromAttribute == rhs.fromAttribute &&
        lhs.toAttribute == rhs.toAttribute &&
        lhs.relation == rhs.relation &&
        lhs.multiplier == rhs.multiplier else {
            return false
    }
    return true
}
