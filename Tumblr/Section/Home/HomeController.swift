//
//  HomeController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit

class HomeController: WMPageController {

    init() {
        super.init(nibName: nil, bundle: nil)
        
        pageAnimatable      = false
        menuViewStyle       = .line
        titleColorNormal = Const.Color.black
        titleColorSelected = UIColor.black
        progressViewIsNaughty = true
        titleSizeNormal = 18
        titleSizeSelected = 18
        titleSizeSelected   = self.titleSizeNormal
        showOnNavigationBar = true
        dataSource          = self
        titles = [
            "视频", "图片", "文字"]
        
        selectIndex = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HomeController {
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return titles!.count
    }
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        return titles![index]
    }
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        switch index {
        case 0:
            return HomeViewController(with: .video)
        case 1:
            return HomeViewController(with: .photo)
        case 2:
            return HomeViewController(with: .text)
        default:
            return HomeViewController(with: .photo)
        }
    }
}
