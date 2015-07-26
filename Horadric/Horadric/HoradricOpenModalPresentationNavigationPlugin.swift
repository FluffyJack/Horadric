//
//  HoradricModalPresentationNavigationPlugin.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

public class HoradricOpenModalPresentationNavigationPlugin : NSObject, HoradricNavigationPlugin {
    public var URLScheme: String { return "openmodal" }
    
    public func handleNavigationAction(navigationAction: WKNavigationAction, forController controller: HoradricViewController, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let nextHoradricViewController = HoradricViewController()
        nextHoradricViewController.page = navigationAction.request.URL?.absoluteString?.stringByReplacingOccurrencesOfString("\(URLScheme)://", withString: "", options: nil, range: nil)
        controller.presentViewController(nextHoradricViewController, animated: true, completion: nil)
        decisionHandler(.Cancel)
    }
}