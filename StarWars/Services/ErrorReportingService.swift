//
//  ErrorReportingService.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

class ErrorReportingService: ErrorReportingServiceProtocol {

    func report(error: Error) {
        print(error.localizedDescription)
    }
}
