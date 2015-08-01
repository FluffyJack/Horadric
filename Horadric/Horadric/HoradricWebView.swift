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
    public func loadFile(fileName: String, withExtension fileExtension: String, directory: String?) {
        
        let bundles = HoradricConfigManager.sharedInstance.registeredWebBundles

        for bundle in bundles {
            if let pageURL = bundle.URLForResource(fileName, withExtension: fileExtension, subdirectory: directory) {
                self.loadRequest(NSURLRequest(URL: pageURL))
            }
        }
        
    }
}
