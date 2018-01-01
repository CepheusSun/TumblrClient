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
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authenticator: TMOAuthAuthenticator!
    var session: TMURLSession!
    var applicationCredentials: TMAPIApplicationCredentials!
    var oauthswift: OAuth2Swift!
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        registTumblrSDK()
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController(
            session: session,
            authenticator: authenticator)
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        authenticator.handleOpen(url)
        return true
    }

}


extension AppDelegate {
    private func registTumblrSDK() {
        applicationCredentials = TMAPIApplicationCredentials(
            consumerKey: Const.Tumblr.customKey.rawValue,
            consumerSecret: Const.Tumblr.secretKey.rawValue)
        
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
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

