//
//  HoradricPushNavigationHandler.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

public class HoradricPushNavigationPlugin
: NSObject, HoradricNavigationPlugin {
    public var URLScheme: String { return "push" }
    
    public func handleNavigationAction(navigationAction: WKNavigationAction, forController controller: HoradricViewController, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let newPage = navigationAction.request.URL?.lastPathComponent
        let newPageSubdirectory = navigationAction.request.URL?.simplePath
        
        if let navController = controller.navigationController {
            if newPage == "goback" {
                navController.popViewControllerAnimated(true)
            } else {
                let nextHoradricViewController = HoradricViewController()
                nextHoradricViewController.file = newPage
                nextHoradricViewController.directory = newPageSubdirectory
                navController.pushViewController(nextHoradricViewController, animated: true)
            }
        }
        
        decisionHandler(.Cancel)
    }
}