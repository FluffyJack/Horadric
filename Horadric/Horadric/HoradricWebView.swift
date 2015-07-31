//
//  HoradricWebView.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

public class HoradricWebView: WKWebView {
    public func loadPage(page: String) {
        
        let bundles = HoradricConfigManager.sharedInstance.registeredWebBundles

        for bundle in bundles {
            if let pageURL = bundle.URLForResource(page, withExtension: "html") {
                self.loadRequest(NSURLRequest(URL: pageURL))
            }
        }
        
    }
}
