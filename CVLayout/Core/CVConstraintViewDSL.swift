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


//
//public protocol SwizzlingInjection: class {
//    static func inject()
//}
//
//
//open class SwizzlingManager {
//    
//    //只会调用一次的方法
//    private static let doOnce: Any? = {
////        UIViewController.inject()
//        UIView.inject()
//        return nil
//    }()
//    
//    public static func enableInjection() {
//        _ = SwizzlingManager.doOnce
//    }
//}
//
//
//extension UIApplication{
//    
//    open override var next: UIResponder?{
//        SwizzlingManager.enableInjection()
//        return super.next
//    }
//}
//
//extension UIViewController: SwizzlingInjection{
//    
//    public static func inject() {
//        //确保不是子类
//        guard self === UIViewController.self else { return }
//        
//        DispatchQueue.once(token: "com.moglo.urmoji.UIViewController") {
//            //do swizzle method
//        }
//    }
//}
//
//extension UIView: SwizzlingInjection {
//    
//    public static func inject() {
//        //确保不是子类
//        guard self === UIView.self else { return }
//        
//        DispatchQueue.once(token: "com.moglo.urmoji.UIViewController") {
//            //do swizzle method
//            
//            let originalMethod = class_getInstanceMethod(self, #selector(layoutSubviews))
//            let swizzledMethod = class_getInstanceMethod(self, #selector(swizzled_layoutSubviews))
//            
//            
//            
//            guard (originalMethod != nil && swizzledMethod != nil) else {
//                return
//            }
//            if class_addMethod(self, #selector(layoutSubviews), method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
//                class_replaceMethod(self, #selector(swizzled_layoutSubviews), method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
//            } else {
//                method_exchangeImplementations(originalMethod!, swizzledMethod!)
//            }
//        }
//    }
//    
//    @objc func swizzled_layoutSubviews() {
//        swizzled_layoutSubviews()
//        print(self)
//        if self.isKind(of: UITableView.self) {
//        }
//        if self.layouts.count > 0 {
//            CVLayout.activate(self.layouts)            
//        }
//    }
//}
//
//
//public extension DispatchQueue {
//    
//    private static var _onceTracker = [String]()
//    
//    class func once(file: String = #file, function: String = #function, line: Int = #line, block:()->Void) {
//        let token = file + ":" + function + ":" + String(line)
//        once(token: token, block: block)
//    }
//    
//    /**
//     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
//     only execute the code once even in the presence of multithreaded calls.
//     
//     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
//     - parameter block: Block to execute once
//     */
//    class func once(token: String, block:()->Void) {
//        objc_sync_enter(self)
//        defer { objc_sync_exit(self) }
//        
//        
//        if _onceTracker.contains(token) {
//            return
//        }
//        
//        _onceTracker.append(token)
//        block()
//    }
//    
//    
//    //delay
//    
//    typealias Task = (_ cancel : Bool) -> Void
//    
//    @discardableResult
//    static func delay(time : TimeInterval, task: @escaping () -> ()) -> Task? {
//        
//        func dispatch_later(block : @escaping () -> ()) {
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time , execute: block)
//        }
//        
//        var closure : (() -> ())? = task
//        var result : Task?
//        
//        let delayedClosure : Task = {
//            cancel in
//            if let internalClosure = closure {
//                if cancel == false {
//                    DispatchQueue.main.async(execute: internalClosure)
//                }
//            }
//            
//            closure = nil
//            result = nil
//        }
//        
//        result = delayedClosure
//        
//        dispatch_later { () -> () in
//            if let delayedClosure = result {
//                delayedClosure(false)
//            }
//        }
//        
//        return result
//    }
//    
//    static func cancel(task : Task?) {
//        task?(true)
//    }
//    
//}
//
