//
//  SEHandler.swift
//  SEHandler
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public typealias Action = () -> Void
public typealias ErrorAction = (FunctionMatcher, Action)

public protocol FunctionMatcher {
    var description: String { get }
}

protocol ErrorHandler {
    var loggers: [ErrorLogger] { get }

    func handle(error: PhantomError, errorActions: [ErrorAction])
}

protocol ErrorHandlerContainer: ErrorHandler {
    var handlers: [ErrorHandler] { get }
}

protocol Contextable {
    var configuration: String { get }
}
