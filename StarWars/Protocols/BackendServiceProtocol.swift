//
//  BackendService.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

protocol BackendServiceProtocol {
    func getMovies() async throws -> Movies
}
