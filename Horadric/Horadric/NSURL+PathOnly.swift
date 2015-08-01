//
//  NSURL+PathOnly.swift
//  Horadric
//
//  Created by Jack Watson-Hamblin on 1/08/2015.
//  Copyright (c) 2015 Prismatik. All rights reserved.
//

import Foundation

internal extension NSURL {
    var simplePath: String? {
        var noFilePath = self.path?.stringByDeletingLastPathComponent
        return noFilePath
    }
}