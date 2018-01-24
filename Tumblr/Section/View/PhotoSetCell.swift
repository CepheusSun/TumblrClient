//
//  PhotoSetCell.swift
//  Tumblr
//
//  Created by sunny on 2018/1/3.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit
import Reusable

class PhotoSetCell: UITableViewCell, NibReusable {

    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var autherNickNameLabel: UILabel!
    @IBOutlet weak var authorUserNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var layout: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(cellType: SinglePhotoCell.self)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    var model: Post! {
        didSet {
            autherNickNameLabel.text = model.blog_name
            authorUserNameLabel.text = model.blog_name 
            avatorImageView.setImage(
                URL(string: "https://api.tumblr.com/v2/blog/\(model.blog_name).tumblr.com/avatar/30"))
            
            collectionView.reloadData()
            
//            model.photoset_layout.ifSome {
//                self.layout = Array($0)
//            }
            
        }
    }
}

extension PhotoSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.photos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SinglePhotoCell.self)
        cell.model = model.photos![indexPath.row]
        return cell
    }
}

extension PhotoSetCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return model.imageSizeFor(index: indexPath.row)
    }
}
