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
        if let path = NSBundle.mainBundle().pathForResource(page, ofType: "html") {
            if let page = NSURL(fileURLWithPath: path) {
                self.loadRequest(NSURLRequest(URL: page))
            }
        }
    }
}
