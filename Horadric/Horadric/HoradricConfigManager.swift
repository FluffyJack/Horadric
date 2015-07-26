//
//  HoradricConfigManager.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import Foundation
import WebKit

public protocol HoradricNavigationPlugin : NSObjectProtocol {
    var URLScheme: String { get }
    
    func handleNavigationAction(navigationAction: WKNavigationAction, forController: HoradricViewController, decisionHandler: (WKNavigationActionPolicy)->Void)
}

public class HoradricConfigManager : NSObject {
    static public let sharedInstance = HoradricConfigManager()
    
    private var registeredNavigationPlugins: [String : HoradricNavigationPlugin] = [:]
    
    public func registerNavigationPlugin(navPlugin: HoradricNavigationPlugin) {
        registeredNavigationPlugins[navPlugin.URLScheme] = navPlugin
    }
    
    public func navigationPluginForURLScheme(URLScheme: String) -> HoradricNavigationPlugin? {
        return registeredNavigationPlugins[URLScheme]
    }
}