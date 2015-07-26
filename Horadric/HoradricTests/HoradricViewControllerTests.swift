//
//  HoradricViewControllerTests.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import XCTest

import Horadric

class HoradricViewControllerTests: XCTestCase {
    
    func testConfigHasUserContentController() {
        let controller = HoradricViewController()
        XCTAssertNotNil(controller.config.userContentController)
    }
    
    func testRunningJavascript() {
        let expectation = self.expectationWithDescription("addUserScript: gets called")
        let mockUserContentController = MockUserContentController()
        let controller = HoradricViewController()
        controller.userContentController = mockUserContentController
        
        mockUserContentController.testBlock = {
            expectation.fulfill()
        }
        
        controller.runJavascript("alert('test');")
        
        self.waitForExpectationsWithTimeout(1.0, handler: nil)
    }
    
}
