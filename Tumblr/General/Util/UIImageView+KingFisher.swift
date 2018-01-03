//  UIImageView+Network.swift
//  SofaMovie-swift
//
//  Created by sunny on 2017/5/4.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

import UIKit
import Kingfisher

public enum SYImageCacheOption {
    case `default`
    case memory
}

public enum SYImagePlaceHolder: String {
    
    case comentHeader = "header_default"
    case userHeader = "person_avator"
    case none = ""
}

public extension UIImageView {
    
    /// 为 ImageView 设置图片的工厂方法
    ///
    /// - Parameters:
    ///   - url: 网络图片的地址
    ///   - placeholder: 占位图片
    ///   - option: 图片来源
    func setImage(_ url: URL?, placeholder: SYImagePlaceHolder = .none, option: SYImageCacheOption = .default) {
        self.contentMode = .scaleToFill
        
        var placeholderImage: Image? = nil
        
        if placeholder != .none {
            placeholderImage = Image(named: placeholder.rawValue)
        }
        if url == nil {
            self.image = placeholderImage
            return
        }
        
        var options: [KingfisherOptionsInfoItem]?
        
        if option == .memory {
            options = [KingfisherOptionsInfoItem.cacheMemoryOnly]
        }
        
        self.kf.setImage(with: url,
                         placeholder: placeholderImage,
                         options: options,
                         progressBlock: nil) {[weak self] (image, error, cacheType, imageURL) in
                            self?.contentMode = .scaleAspectFit
        }
    }
}
