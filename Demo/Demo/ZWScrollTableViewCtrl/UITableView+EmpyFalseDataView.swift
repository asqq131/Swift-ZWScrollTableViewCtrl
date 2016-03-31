//
//  UItableView+EmpyFalseDataView.swift
//  efx
//
//  Created by mac on 16/3/31.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

extension UITableView {
    private struct AssociatedKeys {
        static var empyFalseDataView = "EmpyFalseDataView"
        static var networkReloadView = "NetworkReloadView"
    }
    
    var emptyDataView: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.empyFalseDataView) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.empyFalseDataView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var networkReloadView: UIView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.networkReloadView) as? UIView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.networkReloadView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
