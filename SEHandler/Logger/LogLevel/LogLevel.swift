//
//  LogLevel.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import os

protocol LoggableLevel {
    var osLevel: OSLogType { get }
}

enum LogLevel: LoggableLevel {
    case `default`
    case info
    case debug
    case error
    case fault

    var osLevel: OSLogType {
        switch self {
        case .default:
            return .default
        case .info:
            return .info
        case .debug:
            return .debug
        case .error:
            return .error
        case .fault:
            return .fault
        }
    }
}
