//
//  HoradricConfigManager.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import Foundation
import WebKit

public class HoradricConfigManager : NSObject {
    static public let sharedInstance = HoradricConfigManager()
    
    internal var registeredNavigationPlugins: [String : HoradricNavigationPlugin] = [:]
    internal var registeredWebBundles: [NSBundle] = []
    
    public override init() {
        super.init()
        
        registerNavigationPlugin(HoradricPushNavigationPlugin())
        registerNavigationPlugin(HoradricOpenModalPresentationNavigationPlugin())
        registerNavigationPlugin(HoradricCloseModalPresentationNavigationPlugin())
    }
    
    // MARK: - Navigation plugin management
    
    public func registerNavigationPlugin(navPlugin: HoradricNavigationPlugin) {
        registeredNavigationPlugins[navPlugin.URLScheme] = navPlugin
    }
    
    public func navigationPluginForURLScheme(URLScheme: String) -> HoradricNavigationPlugin? {
        return registeredNavigationPlugins[URLScheme]
    }
    
    // MARK: - Web resource bundle management
    
    public func registerWebBundle(bundle: NSBundle) {
        registeredWebBundles.append(bundle)
    }
}