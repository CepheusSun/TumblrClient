//
//  NavigationController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = UIColor.colorWithRGB(54, g: 70, b: 93)
            
//        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.barStyle = .black

    }



}
