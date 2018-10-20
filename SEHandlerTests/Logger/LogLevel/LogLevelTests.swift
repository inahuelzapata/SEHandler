//
//  LogLevelTests.swift
//  SEHandlerTests
//
//  Created by Nahuel Zapata on 10/20/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import Nimble
@testable import SEHandler
import XCTest

class LogLevelTests: XCTestCase {

    func testShouldNoInstantiateValidLogLevel() {
        let result = LogLevel("I am not valid")

        expect(result).to(beNil())
    }

    func testShouldInstantiateDebugLogLevel() {
        let givenLevel = "Debug"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.debug))
    }

    func testShouldInstantiateFatalLogLevel() {
        let givenLevel = "fatal"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.fatal))
    }

    func testShouldInstantiateTraceLogLevel() {
        let givenLevel = "trace"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.trace))
    }

    func testShouldInstantiateInfoLogLevel() {
        let givenLevel = "info"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.info))
    }

    func testShouldInstantiateWarningLogLevel() {
        let givenLevel = "warning"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.warning))
    }

    func testShouldInstantiateErrorLogLevel() {
        let givenLevel = "error"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.error))
    }

    func testShouldInstantiateOffLogLevel() {
        let givenLevel = "off"

        let result = LogLevel(givenLevel)

        expect(result).to(equal(LogLevel.off))
    }

    func testCreateMultipleLogLevelWithoutCaseSensitive() {
        let givenLevels = ["OfF", "ErrOr", "WARNING", "Info", "TrAcE", "debug"]

        let result = givenLevels.map { return LogLevel($0) }

        expect(result).to(haveCount(6))
        expect(result).to(contain(LogLevel.debug))
        expect(result).to(contain(LogLevel.trace))
        expect(result).to(contain(LogLevel.info))
        expect(result).to(contain(LogLevel.off))
        expect(result).to(contain(LogLevel.warning))
        expect(result).to(contain(LogLevel.error))
    }
}
