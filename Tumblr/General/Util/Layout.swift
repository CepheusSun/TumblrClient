//
//  SYLayout.swift
//  QKSwift
//
//  Created by sunny on 2017/3/29.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

import UIKit

/// 基于 iPhone6p 大小进行垂直方向的适配
///
/// - Parameter iPhone6p: iPhone6p 垂直方向的尺寸
/// - Returns: 其他型号设备的尺寸

let kPlusScale: CGFloat = layoutHorizontal(iPhone6p: 1)

public func layoutVertical(iPhone6p: CGFloat) -> CGFloat {
    
    var newHeight: CGFloat = 0
    switch iPhoneModel.current() {
    case .iPhone4:
        newHeight = iPhone6p * (480.0 / 736.0)
    case .iPhone5:
        newHeight = iPhone6p * (568.0 / 736.0)
    case .iPhone6:
        newHeight = iPhone6p * (667.0 / 736.0)
    case .iPhone6p:
        newHeight = iPhone6p
    case .iPhoneX :
        newHeight = iPhone6p * (812.0 / 736.0)
    default:
        newHeight = iPhone6p * (1024 / 736.0 * 0.9)
    }
    return newHeight
}


/// 基于 iPhone6p水平方向大小进行适配
///
/// - Parameter iPhone6p: iPhone6p 水平方向的尺寸
/// - Returns: 其他型号设备的尺寸
public func layoutHorizontal(iPhone6p: CGFloat) -> CGFloat {
    
    var newWidth: CGFloat = 0
    
    switch iPhoneModel.current() {
    case .iPhone4:
        newWidth = iPhone6p * (320.0 / 414.0)
    case .iPhone5:
        newWidth = iPhone6p * (320.0 / 414.0)
    case .iPhone6:
        newWidth = iPhone6p * (375.0 / 414.0)
    case .iPhone6p:
        newWidth = iPhone6p
    case .iPhoneX :
        newWidth = iPhone6p * (375.0 / 414.0)
    default:
        newWidth = iPhone6p * (414.0 / 375.0 * 0.9)
    }
    
    return newWidth
}

/// 根据 iPhone6p 字体进行屏幕的适配
///
/// - Parameter iPhone6p: iPhone6p 字体大小
/// - Returns: 其他型号设备字体大小
public func layoutFont(iPhone6p: CGFloat) -> CGFloat {
    
    var newFont: CGFloat = 0
    
    switch iPhoneModel.current() {
    case .iPhone4:
        newFont = iPhone6p * (320.0 / 414.0)
    case .iPhone5:
        newFont = iPhone6p * (320.0 / 414.0)
    case .iPhone6:
        newFont = iPhone6p * (375.0 / 414.0)
    case .iPhone6p:
        newFont = iPhone6p
    case .iPhoneX:
        newFont = iPhone6p * (375.0 / 414.0)
    default:
        newFont = iPhone6p * 1.2
    }
    return newFont
}

public func layoutSystemFont(size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: layoutFont(iPhone6p: size))
}

/// 根据横屏状态获取屏幕高度
///
/// - Returns: 始终返回屏幕的高
public func ScreenHeight() -> CGFloat {
    if SYDevice.device.isHorizontal() {
        return UIScreen.main.bounds.width
    }
    return UIScreen.main.bounds.height
}

public func ScreenWidth() -> CGFloat {
    if SYDevice.device.isHorizontal() {
        return UIScreen.main.bounds.height
    }
    return UIScreen.main.bounds.width
}

/// 手机型号的枚举
public enum iPhoneModel {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6p
    case iPhoneX
    case iPad
    
    /// 获取当前手机型号
    ///
    /// - Returns: 返回手机型号的枚举值
    static func current() -> iPhoneModel {
        switch  ScreenHeight(){
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6p
        case 812:
            return .iPhoneX
        default:
            return .iPad
        }
    }
}

