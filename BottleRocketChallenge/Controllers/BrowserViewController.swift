//
//  BrowserViewController.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 4/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController {
    
    var webView:WKWebView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupWebView()
        setupConstraints()
        addBrowserButtons()
    }
    
    func addBrowserButtons() {
        
        let backButton = UIBarButtonItem.init(image: UIImage(named:"ic_webBack"), style: .plain, target: self, action: #selector(goBack))
        let reloadButton = UIBarButtonItem.init(image: UIImage(named:"ic_webRefresh"), style: .plain, target: self, action: #selector(reaload))
        let forwardButton = UIBarButtonItem.init(image: UIImage(named:"ic_webForward"), style: .plain, target: self, action: #selector(goForward))
        self.navigationItem.leftBarButtonItems = [backButton, reloadButton, forwardButton]
    }
    
    func setupConstraints(){
        
        webView?.translatesAutoresizingMaskIntoConstraints = false
        guard let horizontalConstraint = webView?.centerXAnchor.constraint(equalTo: view.centerXAnchor) else { return  }
        guard let verticalConstraint = webView?.centerYAnchor.constraint(equalTo: view.centerYAnchor) else { return  }
        guard let widthConstraint = webView?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0) else {return}
        guard let heightConstraint = webView?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0) else {return}
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
    
    func setupWebView(){
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        let setup = WKWebViewConfiguration()
        webView = WKWebView(frame: rect, configuration: setup)
        let url = URL(string: "https://www.bottlerocketstudios.com")
        //Verify this with the Style Guide
        let myRequest = URLRequest(url: url!)
        view.addSubview(webView!)
        webView?.load(myRequest)
    }
    
    @objc func goBack(sender:UIBarButtonItem) {
        webView?.goBack()
    }
    
    @objc func reaload(sender:UIBarButtonItem) {
        webView?.reload()
    }
    
    @objc func goForward(sender:UIBarButtonItem) {
        webView?.goForward()
    }

}
