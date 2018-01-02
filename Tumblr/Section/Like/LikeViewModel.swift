
//
//  LikeViewModel.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import TMTumblrSDK.TMAPIClient

final class LikeViewModel {
    
    var list: [Post] = []
    
    func load(_ callback: @escaping () -> Void){
        HTTPClient.likesDataTask(withParameters: ["limit":1, "offset": 1]) {[weak self] (res, error) in
            
            let resObj = try? Mappable.mapResponseToArray(res!, to: Post.self, with: "liked_posts")
            self?.list = resObj!
            callback()
        }.resume()
    }
}

