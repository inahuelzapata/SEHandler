//
//  PhantomError.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 4/26/19.
//  Copyright © 2019 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol PhantomError: Error, Taggable { }

extension PhantomError {
    var tag: String {
        return "Default"
    }
}
