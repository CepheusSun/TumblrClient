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
    var authenticator: TMOAuthAuthenticator!
    var session: TMURLSession!
    var applicationCredentials: TMAPIApplicationCredentials!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        registTumblrSDK()
        
        return true
    }

}


extension AppDelegate {
    private func registTumblrSDK() {
        applicationCredentials = TMAPIApplicationCredentials(
            consumerKey: Const.tumblrCustomKey.rawValue,
            consumerSecret: Const.tumblrSecretKey.rawValue)
        
        session = TMURLSession(
            configuration: URLSessionConfiguration.default,
            applicationCredentials: applicationCredentials,
            userCredentials: TMAPIUserCredentials(),
            networkActivityManager: nil,
            sessionTaskUpdateDelegate: nil,
            sessionMetricsDelegate: nil,
            requestTransformer: nil,
            additionalHeaders: nil)
        
        authenticator =  TMOAuthAuthenticator(
            session: session,
            applicationCredentials: applicationCredentials,
            delegate: self)
        
    }
}

extension AppDelegate: TMOAuthAuthenticatorDelegate {
    
    func openURL(inBrowser url: URL!) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

