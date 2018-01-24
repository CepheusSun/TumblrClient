//
//  PersonController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit

class PersonController: UIViewController {

    let viewModel = PersonViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "个人"
        viewModel.load()
    }

}
