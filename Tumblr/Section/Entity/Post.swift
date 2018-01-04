//
//  Post.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import UIKit

struct Post: Codable {
    
    // 公共
    var blog_name: String    // 博客名称
    var `id`: Int // 博客 id
    var post_url: String // 博客地址
    var type: Type       // 博客种类
    var timestamp: Int   // 博客发表时间
    var date: String     // 博客发表时间
    var format: Format   // 博客发表的格式
    var reblog_key: String // 转发博客需要的 key
    var tags: [String]     // 博客标签
    var bookmarklet: Bool?  // 博客是否通过 Tumblr 的 bookmarket 发表
    var mobile: Bool?      // 博客是否是通过手机发表
    var source_url: String? // 博客文章的地址
    var source_title: String? // The title of the source site
    var liked: Bool? // 是否已喜欢
    var state: State // 博客状态
//    var total_posts: Int // The total number of post available for this request, useful for paginating through results
    
    
    // 文字博客
    var title: String?  // 博客的可选 title
    var body: String?   // 博客的内容
    
    // 图片
    var photos: [Photo]?
    var caption: String? // The user-supplied caption
    var photoset_layout: String?   // 图片集的布局方式

    
    // 视频
    var thumbnail_height: Float?  // 缩略图高
    var thumbnail_width: Float?   // 缩略图宽
    var thumbnail_url: String?    // 缩略图
    
    
    enum `Type`: String, Codable {
        case text = "text"
        case video = "video"
        case photo = "photo"
    }
    
    enum Format: String, Codable {
        case html = "html"
        case markdown = "markdown"
    }
    
    enum State: String, Codable {
        case published = "published" // 发布
        case queued = "queued"        // 排队
        case draft = "draft"            // 草稿
        case `private` = "private"      // 私有

    }
    
    
    struct Photo: Codable {
        var caption: String  //  user supplied caption for the individual photo
        var alt_sizes: [Size]
        var original_size: Size

        struct Size: Codable {
            var width: CGFloat
            var height: CGFloat
            var url: String
        }
        
    }

    func imageSizeFor(index: Int) -> CGSize {
        var res = CGSize.zero
        photoset_layout
            .ifNone {
            
            let height = (photos?.first?.alt_sizes.first?.height).or(30)
            let width = (photos?.first?.alt_sizes.first?.width).or(30)
            let resHeight = ScreenWidth() * height / width
            res = CGSize(
                width: resHeight * height / width,
                height: resHeight)
        }
            .ifSome {
                
                $0.forEach {
                    let count = Int("\($0)")
                    
                }
        }
        
        return res
    }

    func cellHeight() -> CGFloat {
        
        switch type {
        case .photo:
            var res = CGFloat(30 + 100)
            photoset_layout.ifNone {
                let height = (photos?.first?.alt_sizes.first?.height).or(30)
                let width = (photos?.first?.alt_sizes.first?.width).or(30)
                res = ScreenWidth() * height / width + 30
            }
            return res
        case .video:
            return CGFloat(30 + 16 + ScreenWidth() * thumbnail_height.or(0) / thumbnail_width.or(1))
        case .text:
            return CGFloat(30 + 16 + ScreenWidth() * thumbnail_height.or(0) / thumbnail_width.or(1))
        } 
    }
    
}
