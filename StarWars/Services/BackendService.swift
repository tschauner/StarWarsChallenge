//
//  BackendService.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

class BackendService: BackendServiceProtocol {

    func getMovies() async throws -> Movies {
        try await APIService.shared.get(.getMovies)
    }
}
