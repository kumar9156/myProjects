//
//  ViewController.swift
//  JSCheck
//
//  Created by Sharath on 09/10/19.
//  Copyright © 2019 Finacle. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webViewContainer: UIView!
    // @IBOutlet weak var myWebView: WKWebView!
    
     var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        let contentController = WKUserContentController();
        
        contentController.add(self, name: "geocodeAddress")//.add(self, name: "geocodeAddress")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: webViewContainer.bounds, configuration: config)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webViewContainer.addSubview(webView)
        
        webView.leadingAnchor.constraint(equalTo: webViewContainer.leadingAnchor, constant: 0).isActive = true
        webView.trailingAnchor.constraint(equalTo: webViewContainer.trailingAnchor, constant: 0).isActive = true
        webView.topAnchor.constraint(equalTo: webViewContainer.topAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewContainer.bottomAnchor, constant: 0).isActive = true
        
        if let url = Bundle.main.url(forResource: "Check", withExtension: "html") {
            let request: URLRequest = NSURLRequest(url: url) as URLRequest
            webView.load(request)
        }
    }
}

extension ViewController:WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("came here")
    }
}

