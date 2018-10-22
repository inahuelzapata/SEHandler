//
//  SEFormatter.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/21/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

class SEFormatter: Formatter {
    var identifier: String

    required init(_ identifier: String) {
        self.identifier = identifier
    }

    func update(withDictionary dictionary: [String: Any]) throws { }

    func format(message: String, info: LogInfoDictionary) -> String {
        return String()
    }
}
