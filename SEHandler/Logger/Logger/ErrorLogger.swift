//
//  ErrorLogger.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

protocol Configurable {
    var context: Contextable { get }
}

protocol ErrorLogger {
    init(_ configuration: Configurable)

    var configuration: Configurable { get }

    var thresholdLevel: LogLevel { get set }

    var asynchronous: Bool { get set }
}
//
//class SELogger: ErrorLogger {
//    var configuration: Configurable
//
//    required init(_ configuration: Configurable) {
//        self.configuration = configuration
//    }
//
//    public let identifier: String
//
//    var parent: ErrorLogger?
//
//    private var thresholdLevelStorage: LogLevel
//    private var asynchronousStorage = false
//    private var appendersStorage: [LogAppender]
////
////    public init(identifier: String, level: LogLevel = LogLevel.debug, appenders: [LogAppender] = []) {
////        self.identifier = identifier
////        self.thresholdLevelStorage = level
////        self.appendersStorage = appenders
////    }
//
////    public convenience init(parentLogger: ErrorLogger, identifier: String) {
////        self.init(identifier: identifier,
////                  level: parentLogger.thresholdLevel,
////                  appenders: [LogAppender]() + parentLogger.appenders)
////        self.parent = parentLogger
////    }
//
//    private static let loggingQueue: DispatchQueue = {
//        let createdQueue: DispatchQueue
//
//        createdQueue = DispatchQueue(label: "log4swift.dispatchLoggingQueue", qos: .background, attributes: [])
//
//        return createdQueue
//    }()
//
//    public var appenders: [LogAppender] {
//        get {
//            if let parent = self.parent {
//                return parent.appenders
//            } else {
//                return self.appendersStorage
//            }
//        }
//        set {
//            self.breakDependencyWithParent()
//            self.appendersStorage = newValue
//        }
//    }
//
//    public var thresholdLevel: LogLevel {
//        get {
//            if let parent = self.parent {
//                return parent.thresholdLevel
//            } else {
//                return self.thresholdLevelStorage
//            }
//        }
//        set {
//            self.breakDependencyWithParent()
//            self.thresholdLevelStorage = newValue
//        }
//    }
//
//    public var asynchronous: Bool {
//        get {
//            if let parent = self.parent {
//                return parent.asynchronous
//            } else {
//                return self.asynchronousStorage
//            }
//        }
//        set {
//            self.breakDependencyWithParent()
//            self.asynchronousStorage = newValue
//        }
//    }
//
//    func log(message: String, level: LogLevel, file: String? = nil, line: Int? = nil, function: String? = nil) {
//        if self.willIssueLogForLevel(level) {
//            var info: LogInfoDictionary = [
//                    .loggerName: self.identifier,
//                    .logLevel: level,
//                    .timestamp: NSDate().timeIntervalSince1970,
////                    .threadId: currentThreadId(),
////                    .threadName: currentThreadName()
//            ]
//            if let file = file {
//                info[.fileName] = file
//            }
//            if let line = line {
//                info[.fileLine] = line
//            }
//            if let function = function {
//                info[.function] = function
//            }
//
//            let logClosure = {
//                for currentAppender in self.appenders {
//                    currentAppender.log(message, logLevel: level, info: info)
//                }
//            }
//
//            self.executeLogClosure(logClosure)
//        }
//    }
//
//    internal func log(closure: @escaping () -> (String),
//                      level: LogLevel, file: String? = nil,
//                      line: Int? = nil,
//                      function: String? = nil) {
//        if self.willIssueLogForLevel(level) {
//            var info: LogInfoDictionary = [
//                    .loggerName: self.identifier,
//                    .logLevel: level,
//                    .timestamp: NSDate().timeIntervalSince1970,
////                    .threadId: currentThreadId(),
////                    .threadName: currentThreadName()
//            ]
//            if let file = file {
//                info[.fileName] = file
//            }
//            if let line = line {
//                info[.fileLine] = line
//            }
//            if let function = function {
//                info[.function] = function
//            }
//
//            let logClosure = {
//                let logMessage = closure()
//                for currentAppender in self.appenders {
//                    currentAppender.log(logMessage, logLevel: level, info: info)
//                }
//            }
//            self.executeLogClosure(logClosure)
//        }
//    }
//
//    public func trace(_ format: String,
//                      _ args: CVarArg...,
//                      file: String = #file,
//                      line: Int = #line,
//                      function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.trace, file: file, line: line, function: function)
//    }
//
//    public func debug(_ format: String,
//                      _ args: CVarArg...,
//                      file: String = #file,
//                      line: Int = #line,
//                      function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.debug, file: file, line: line, function: function)
//    }
//
//    public func info(_ format: String,
//                     _ args: CVarArg...,
//                     file: String = #file,
//                     line: Int = #line,
//                     function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.info, file: file, line: line, function: function)
//    }
//
//    public func warning(_ format: String,
//                        _ args: CVarArg...,
//                        file: String = #file,
//                        line: Int = #line,
//                        function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.warning, file: file, line: line, function: function)
//    }
//
//    public func error(_ format: String,
//                      _ args: CVarArg...,
//                      file: String = #file,
//                      line: Int = #line,
//                      function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.error, file: file, line: line, function: function)
//    }
//
//    public func fatal(_ format: String,
//                      _ args: CVarArg...,
//                      file: String = #file,
//                      line: Int = #line,
//                      function: String = #function) {
//        let formattedMessage = format.format(args: args)
//        self.log(message: formattedMessage, level: LogLevel.fatal, file: file, line: line, function: function)
//    }
//
//    public func trace(file: String = #file,
//                      line: Int = #line,
//                      function: String = #function,
//                      closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.trace, file: file, line: line, function: function)
//    }
//
//    public func debug(file: String = #file,
//                      line: Int = #line,
//                      function: String = #function,
//                      closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.debug, file: file, line: line, function: function)
//    }
//
//    public func info(file: String = #file,
//                     line: Int = #line,
//                     function: String = #function,
//                     closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.info, file: file, line: line, function: function)
//    }
//
//    public func warning(file: String = #file,
//                        line: Int = #line,
//                        function: String = #function,
//                        closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.warning, file: file, line: line, function: function)
//    }
//
//    public func error(file: String = #file,
//                      line: Int = #line,
//                      function: String = #function,
//                      closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.error, file: file, line: line, function: function)
//    }
//
//    public func fatal(file: String = #file,
//                      line: Int = #line,
//                      function: String = #function,
//                      closure: @escaping () -> String) {
//        self.log(closure: closure, level: LogLevel.fatal, file: file, line: line, function: function)
//    }
//
//    public func willIssueLogForLevel(_ level: LogLevel) -> Bool {
//        return level.rawValue >= self.thresholdLevel.rawValue &&
//            self.appenders.reduce(false) { shouldLog, currentAppender in
//                shouldLog || level.rawValue >= currentAppender.thresholdLevel.rawValue
//        }
//    }
//
//    private func executeLogClosure(_ logClosure: @escaping () -> Void) {
//        if self.asynchronous {
//            SELogger.loggingQueue.async(execute: logClosure)
//        } else {
//            logClosure()
//        }
//    }
//}
//
//extension SELogger {
//    private func breakDependencyWithParent() {
//        guard let parent = self.parent else {
//            return
//        }
//        self.thresholdLevelStorage = parent.thresholdLevel
//        self.appendersStorage = parent.appenders
//        self.parent = nil
//    }
//
//    private final class func createDefaultAppenders() -> [LogAppender] {
//        return []
//    }
//
//    func reset() {
//        self.thresholdLevel = .debug
//        self.appenders = SELogger.createDefaultAppenders()
//        self.asynchronousStorage = false
//    }
//}
