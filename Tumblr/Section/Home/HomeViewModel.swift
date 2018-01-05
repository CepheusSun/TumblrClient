//
//  HomeViewModel.swift
//  Tumblr
//
//  Created by sunny on 2018/1/5.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import TMTumblrSDK.TMAPIClient

final class HomeViewModel {
    
    var list: [Post] = []
    
    func load(_ callback: @escaping () -> Void){
        HTTPClient.likesDataTask(withParameters: ["limit":2, "offset": 0]) {[weak self] (res, error) in
            print(res.or([:]))
            print(error)
            let resObj = try? Mappable.mapResponseToArray(res!, to: Post.self, with: "liked_posts")
            self?.list = resObj!
            callback()
            }.resume()
    }
}
