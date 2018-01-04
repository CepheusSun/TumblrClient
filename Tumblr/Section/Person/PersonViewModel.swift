
//
//  PersonViewModel.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import TMTumblrSDK.TMAPIClient

final class PersonViewModel {
    
    func load() {
        HTTPClient.userInfoDataTask(callback: { (res, error) in
            print(res!["user"].or("no user"))
        }).resume()
    }
}
