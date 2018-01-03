//
//  SinglePhotoCell.swift
//  Tumblr
//
//  Created by sunny on 2018/1/3.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit
import Reusable

class SinglePhotoCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var model: Post.Photo! {
        didSet {
            mainImageView.setImage(URL(string: model.alt_sizes[2].url))
        }
    }

}
