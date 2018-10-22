//
//  LogInfoKeys.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/21/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public enum LogInfoKeys {
    case logLevel
    case loggerName
    case fileName
    case fileLine
    case function
    case timestamp
    case threadId
    case threadName
}

public typealias LogInfoDictionary = [LogInfoKeys: CustomStringConvertible]
