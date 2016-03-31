//
//  UIView+FixRatio.swift
//  efx
//
//  Created by mac on 16/3/25.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

extension UIView  {

    /*
    * 按iPhone6的比例计算高度
    */
    class func fixRatioHeightByIphone6(height: CGFloat) -> CGFloat {
        return (height / 647.0) * kScreenSize.height;
    }
    
    /*
    * 按iPhone6的比例计算宽度
    */
    class func fixRatioWidthByIphone6(width: CGFloat) -> CGFloat {
        return (width / 375.0) * kScreenSize.width;
    }

}
