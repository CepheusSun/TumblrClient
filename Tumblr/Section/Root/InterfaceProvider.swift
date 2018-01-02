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
    static func mainTabbar() -> ESTabBarController {
        
        let tabbarController = ESTabBarController()
        
        if let tabBar = tabbarController.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillIncludeSeparator
        }
        
        let v1 = HomeController()
        let v2 = LikeController()
        let v3 = PersonController()
        
        v1.tabBarItem = ESTabBarItem(
            TabbarBasicContentView(),
            title: nil,
            image: UIImage(named: "home"),
            selectedImage: UIImage(named: "home_1"))
        
        v2.tabBarItem = ESTabBarItem(
            TabbarBasicContentView(),
            title: nil,
            image: UIImage(named: "favor"),
            selectedImage: UIImage(named: "favor_1"))
        
        v3.tabBarItem = ESTabBarItem(
            TabbarBasicContentView(),
            title: nil,
            image: UIImage(named: "me"),
            selectedImage: UIImage(named: "me_1"))
        
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
        backdropColor = UIColor.colorWithRGB(54, g: 70, b: 93)
        highlightBackdropColor = backdropColor
    }
    
    override func highlightAnimation(animated: Bool, completion: (() -> ())?) {
        UIView.beginAnimations("small", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = imageView.transform.scaledBy(x: 0.8, y: 0.8)
        imageView.transform = transform
        UIView.commitAnimations()
        completion?()
    }
    
    override func dehighlightAnimation(animated: Bool, completion: (() -> ())?) {
        UIView.beginAnimations("big", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = CGAffineTransform.identity
        imageView.transform = transform.scaledBy(x: 1.15, y: 1.15)
        UIView.commitAnimations()
        completion?()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


