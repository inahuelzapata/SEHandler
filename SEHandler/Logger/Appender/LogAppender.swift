//
//  LogAppender.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

protocol LogAppender {

    var identifier: String { get set }
    var thresholdLevel: LogLevel { get set }
    var formatter: Formatter? { get set }

    func log(_ log: String, logLevel: LogLevel, info: LogInfoDictionary)

    init(identifier: String)
}

class SEAppender: LogAppender {

    var identifier: String
    public var thresholdLevel: LogLevel = LogLevel.debug
    var formatter: Formatter?

    required init(identifier: String) {
        self.identifier = identifier
    }

    func log(_ log: String, logLevel: LogLevel, info: LogInfoDictionary) {

    }

    func log(_ log: String, level: LogLevel, info: LogInfoDictionary) {
        if level.rawValue >= self.thresholdLevel.rawValue {
            let logMessage: String

            if let formatter = self.formatter {
                logMessage = formatter.format(message: log, info: info)
            } else {
                logMessage = log
            }

//            self.performLog(logMessage, level: level, info: info)
        }
    }
}
