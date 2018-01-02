
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
    
    func load() {
        HTTPClient.likesDataTask(withParameters: ["limit":1, "offset": 0]) { (res, error) in
            print(res)
        }.resume()
    }
}

