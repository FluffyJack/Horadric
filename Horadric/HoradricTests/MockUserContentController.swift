//
//  MockUserContentController.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 26/07/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import UIKit
import WebKit

class MockUserContentController: WKUserContentController {
    
    var testBlock: (()->())?

    override func addUserScript(userScript: WKUserScript) {
        if let theBlock = testBlock {
            theBlock()
        }
    }

}
