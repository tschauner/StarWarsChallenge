//
//  MockErrorReportingService.swift
//  StarWarsTests
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation
import XCTest
@testable import StarWars

class MockErrorReportingService: ErrorReportingServiceProtocol {
    var expectation: XCTestExpectation?
    var reportableMessage: String?

    func report(error: any Error) {
        expectation?.fulfill()

        reportableMessage = error.localizedDescription
    }
}
