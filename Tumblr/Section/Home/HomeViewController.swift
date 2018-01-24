//
//  HomeViewController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/5.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel!

    init(with type: PostType) {
        super.init(nibName: nil, bundle: nil)
        viewModel = HomeViewModel.init(with: type)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.load {
            print("finish")
        }
    }

}
