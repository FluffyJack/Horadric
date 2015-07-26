//
//  HoradricConfigManager.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import XCTest

import Horadric

class HoradricConfigManagerTests: XCTestCase {
    
    func testAlwaysGetTheSameInstance() {
        XCTAssertEqual(HoradricConfigManager.sharedInstance, HoradricConfigManager.sharedInstance)
    }
    
    func testRegisteringNavigationPlugins() {
        let manager = HoradricConfigManager()
        let navPlugin = MockNavigationPlugin()
        manager.registerNavigationPlugin(navPlugin)
        let comparisonPlugin = manager.navigationPluginForURLScheme(navPlugin.URLScheme) as! MockNavigationPlugin
        XCTAssertEqual(navPlugin, comparisonPlugin)
    }
    
}
