//
//  OAuthViewController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class OAuthViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.rx.controlEvent(.touchUpInside)
            .asObservable()
            .subscribe(onNext: { _ in
                HTTP.authenticate()
            }).disposed(by: bag)
        
    }


}
