//
//  Taggable.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 4/26/19.
//  Copyright © 2019 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol Taggable {
    var tag: String { get }
}

extension Taggable {
    var tag: String {
        return String()
    }
}
