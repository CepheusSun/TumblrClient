//
//  HTTPEngine.swift
//  Tumblr
//
//  Created by sunny on 2017/12/30.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

import Foundation
import TMTumblrSDK.TMURLSession
import TMTumblrSDK.TMOAuthAuthenticator



let HTTP = HTTPEngine()

final class HTTPEngine: NSObject {

    // UserDefaults 保存的 OAuth token 和 secret key
    enum TokenKey: String {
        case token = "HTTPEngine_Tumblr_Token"
        case secret = "HTTPEngine_Tumblr_TokenSecret"
    }
    
    var authenticator: TMOAuthAuthenticator!
    var session: TMURLSession!
    
    fileprivate override init() {
        super.init()
        let applicationCredentials = TMAPIApplicationCredentials(
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
    
    // 这个方法用来验证 Oauth
    func authenticate() {
        
        let token = UserDefaults.standard.string(forKey: TokenKey.token.rawValue)
        let secret = UserDefaults.standard.string(forKey: TokenKey.secret.rawValue)
        
        if let token = token, let secret = secret {
            self.session = TMURLSession(
                configuration: URLSessionConfiguration.default,
                applicationCredentials: TMAPIApplicationCredentials(
                    consumerKey: Const.Tumblr.customKey.rawValue,
                    consumerSecret: Const.Tumblr.secretKey.rawValue),
                userCredentials: TMAPIUserCredentials(
                    token: token,
                    tokenSecret: secret)
            )
            // 切换控制器
            
        } else {
            authenticator.authenticate("Tumblr-sunny") { (creds, error) in
                DispatchQueue.main.async {
                    switch error {
                    case .none:
                        UserDefaults.standard.set(creds?.token!, forKey: TokenKey.token.rawValue)
                        UserDefaults.standard.set(creds?.tokenSecret!, forKey: TokenKey.secret.rawValue)
                        self.authenticate()
                    case .some(_):
                        print("失败")
                    }
                }
            }
        }
    }
    
    // 判断授权是否成功
    func isOAuth() -> Bool {
        let token = UserDefaults.standard.string(forKey: TokenKey.token.rawValue)
        let secret = UserDefaults.standard.string(forKey: TokenKey.secret.rawValue)
        if let _ = token, let _ = secret {
            return true
        }
        return false
    }
    
    
    
    
    
    
}


extension HTTPEngine: TMOAuthAuthenticatorDelegate {
    
    func openURL(inBrowser url: URL!) {
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
