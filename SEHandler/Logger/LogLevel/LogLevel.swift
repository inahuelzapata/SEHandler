//
//  LogLevel.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public enum LogLevel: Int, CustomStringConvertible {
    case trace = 0
    case debug = 1
    case info = 2
    case warning = 3
    case error = 4
    case fatal = 5
    case off = 6

    public init?(_ stringValue: String) {
        switch stringValue.lowercased() {
        case LogLevel.trace.description:
            self = .trace
        case LogLevel.debug.description:
            self = .debug
        case LogLevel.info.description:
            self = .info
        case LogLevel.warning.description:
            self = .warning
        case LogLevel.error.description:
            self = .error
        case LogLevel.fatal.description:
            self = .fatal
        case LogLevel.off.description:
            self = .off
        default:
            return nil
        }
    }

    public var description: String {
        switch self {
        case .trace:
            return "trace"
        case .debug:
            return "debug"
        case .info:
            return "info"
        case .warning:
            return "warning"
        case .error:
            return "error"
        case .fatal:
            return "fatal"
        case .off:
            return "off"
        }
    }
}
