//
//  AppDelegate.swift
//  Tumblr
//
//  Created by sunny on 2017/12/30.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

import UIKit
import TMTumblrSDK.TMURLSession
import TMTumblrSDK.TMOAuthAuthenticator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        configRootViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        HTTP.authenticator.handleOpen(url)
        return true
    }
    

}


extension AppDelegate {
    func configRootViewController() {
        if HTTP.isOAuth() {
            // 获得授权, 进入界面
            self.window?.rootViewController = InterfaceProvider.mainTabbar()
        } else {
            // 没有授权, 进入 OAuth 页面
            self.window?.rootViewController = InterfaceProvider.OAuth() 
        }
    }
}

