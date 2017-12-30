//
//  ViewController.swift
//  Tumblr
//
//  Created by sunny on 2017/12/30.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

import UIKit
import TMTumblrSDK.TMAPIClient

class ViewController: UIViewController {

    var session: TMURLSession
    var authenticator: TMOAuthAuthenticator
    
    lazy var authButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 25, y: 50, width: 175, height: 30)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("Authenticate", for: .normal)
        button.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        return button
    }()
    
    var authResultsTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 25, y: 105, width: 250, height: 125))
        textView.backgroundColor = UIColor.lightGray
        textView.textAlignment = .left
        textView.text = "Authentication Request Results"
        return textView
    }()
    
    var unauthedRequestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect.init(x: 25, y: 300, width: 225, height: 30)
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = UIColor.black
        button.setTitle("Send Unauthed Request", for: .normal)
        button.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        return button
    }()
    
    init(session: TMURLSession!, authenticator: TMOAuthAuthenticator) {
        self.session = session
        self.authenticator = authenticator
        
        session.task(with: TMHTTPRequest(
            urlString: "http://www.guoguiyan.com/data/out/113/68555786-large-wallpapers.jpg",
            method: .GET)) { (data, res, err) in
            
        }.resume()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(authButton)
        view.addSubview(authResultsTextView)
        view.addSubview(unauthedRequestButton)

    }

    func setNetworkActivityIndicatorVisible(_ networkActivityIndicatorVisible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = networkActivityIndicatorVisible
    }

    @objc func authenticate() {
        authenticator.authenticate("ello") { (creds, error) in
            
            DispatchQueue.main.async {
                switch error {
                case .none:
                    self.authResultsTextView.text = "Error:"
                case .some(let error):
                    self.authResultsTextView.text = "Error:" + error.localizedDescription
                }
            }
        }
    }
    
    @objc func blogInfo() {
        
    }


}

