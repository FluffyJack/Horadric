//
//  HoradricViewController.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

@IBDesignable
public class HoradricViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    @IBInspectable var page: String?
    
    public var webView: HoradricWebView!
    
    public var userContentController = WKUserContentController()
    
    public var config: WKWebViewConfiguration {
        let config = WKWebViewConfiguration()
        
        config.suppressesIncrementalRendering = true
        config.userContentController = userContentController
        
        addScriptsToUserContentController(userContentController)
        
        return config
    }
    
    // MARK: - Communication methods
    
    public func runJavascript(jsString: String) {
        let userScript = WKUserScript(source: jsString, injectionTime: .AtDocumentEnd, forMainFrameOnly: true)
        
        userContentController.addUserScript(userScript)
    }
    
    // MARK: - Lifecycle methods
    
    func addScriptsToUserContentController(userContentController: WKUserContentController) {
    }
    
    override public func loadView() {
        webView = HoradricWebView(frame: CGRectZero, configuration: config)
        
        webView.navigationDelegate = self
        webView.UIDelegate = self
        
        self.view = webView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if let startingPage = page {
            webView.loadPage(startingPage)
        }
    }
    
    // MARK: - WKNavigationDelegate methods
    
    public func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        self.title = webView.title
    }
    
    public func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if let URLScheme = navigationAction.request.URL?.scheme {
            if let registeredPlugin = HoradricConfigManager.sharedInstance.navigationPluginForURLScheme(URLScheme) {
                registeredPlugin.handleNavigationAction(navigationAction, forController: self, decisionHandler: decisionHandler)
            }
        }
        decisionHandler(.Allow)
    }
    
}
