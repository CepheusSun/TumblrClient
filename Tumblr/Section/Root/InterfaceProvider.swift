//
//  InterfaceProvider.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import Foundation
import ESTabBarController_swift

enum InterfaceProvider {
    // 主界面
    static func mainTabbar() -> UITabBarController {
        
        let tabbarController = UITabBarController()
        
        let v1 = HomeController()
        let v2 = LikeController()
        let v3 = PersonController()
        
        v1.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home_1"))
        v2.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "favor"), selectedImage: #imageLiteral(resourceName: "favor_1"))
        v3.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "me"), selectedImage: #imageLiteral(resourceName: "me_1"))

        tabbarController.tabBar.unselectedItemTintColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        tabbarController.tabBar.tintColor = Const.Color.black
        
        
        tabbarController.viewControllers = [
            NavigationController(rootViewController: v1),
            NavigationController(rootViewController: v2),
            NavigationController(rootViewController: v3)
        ]
        
        return tabbarController
    }
    // OAuth 授权页面
    static func OAuth() -> OAuthViewController{
        return OAuthViewController()
    }
    
    static func switchTo(_ index: Int) {
        assert(index >= 0 && index < 3, "只有4个")
        let tabbarController = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController as! ESTabBarController
        tabbarController.selectedIndex = index
    }

}

class TabbarBasicContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let transform = CGAffineTransform.identity
        imageView.transform = transform.scaledBy(x: 1.15, y: 1.15)
        iconColor = UIColor(white: 165.0 / 255.0, alpha: 1.0)
        
        highlightIconColor = UIColor.white
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


