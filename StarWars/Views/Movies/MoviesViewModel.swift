//
//  MoviesViewModel.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

protocol MoviesViewModelProtocol {
    associatedtype Action
    var backendService: BackendServiceProtocol { get set }
    var movies: [Movie] { get set }
    func handle(action: Action)
    func getMovies()
}

@Observable
class MoviesViewModel: MoviesViewModelProtocol {
    var backendService: BackendServiceProtocol

    var movies: [Movie] = []
    
    init(backendService: BackendServiceProtocol = BackendService()) {
        self.backendService = backendService
    }
    
    @MainActor
    func handle(action: Action) {
        switch action {
        case .movieTapped:
            getMovies()
        }
    }

    @MainActor
    func getMovies() {
        Task {
            do {
                let movies = try await backendService.getMovies().results
                await MainActor.run {
                    self.movies = movies
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension MoviesViewModel {

    enum Action {
        case movieTapped
    }
}
