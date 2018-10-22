//
//  Formatter.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/21/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

protocol Formatter {
    var identifier: String { get }

    init (_ identifier: String)

    func update(withDictionary dictionary: [String: Any]) throws

    func format(message: String, info: LogInfoDictionary) -> String
}
