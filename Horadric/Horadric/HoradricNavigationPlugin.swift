//
//  HoradricNavigationPlugin.swift
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