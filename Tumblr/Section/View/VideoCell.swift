//
//  VideoCell.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit
import Reusable

class VideoCell: UITableViewCell, NibReusable {

    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var autherNickNameLabel: UILabel!
    @IBOutlet weak var authorUserNameLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    var model: Post! {
        didSet {
            videoImageView.setImage(URL(string: model.thumbnail_url))
        }
    }
    
}
