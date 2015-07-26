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
    
    private var registeredNavigationPlugins: [String : HoradricNavigationPlugin] = [:]
    
    public override init() {
        super.init()
        
        registerNavigationPlugin(HoradricPushNavigationPlugin())
        registerNavigationPlugin(HoradricOpenModalPresentationNavigationPlugin())
        registerNavigationPlugin(HoradricCloseModalPresentationNavigationPlugin())
    }
    
    public func registerNavigationPlugin(navPlugin: HoradricNavigationPlugin) {
        registeredNavigationPlugins[navPlugin.URLScheme] = navPlugin
    }
    
    public func navigationPluginForURLScheme(URLScheme: String) -> HoradricNavigationPlugin? {
        return registeredNavigationPlugins[URLScheme]
    }
}