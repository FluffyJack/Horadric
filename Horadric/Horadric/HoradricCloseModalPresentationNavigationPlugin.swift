//
//  HoradricCloseModalPresentationNavigationPlugin.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

public class HoradricCloseModalPresentationNavigationPlugin : NSObject, HoradricNavigationPlugin {
    public var URLScheme: String { return "closemodal" }
    
    public func handleNavigationAction(navigationAction: WKNavigationAction, forController controller: HoradricViewController, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        decisionHandler(.Cancel)
    }
}