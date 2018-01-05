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
    

    var type: PostType!
    
    init(with type: PostType) {
        self.type = type
    }
    var list: [Post] = []
    
    func load(_ callback: @escaping () -> Void){
        HTTPClient.dashboardRequest(["limit": 5, "offset": 0, "type": type.rawValue]) {
            [weak self] (res, error) in
            print(res.or([:]))
            print(error)
            let resObj = try? Mappable.mapResponseToArray(res!, to: Post.self, with: "posts")
            self?.list = resObj!
            callback()
        }.resume()
    }
}
