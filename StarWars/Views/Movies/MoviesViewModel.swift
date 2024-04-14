//
//  MoviesViewModel.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation
import SwiftUI

protocol MoviesViewModelProtocol {
    associatedtype Action
    var backendService: BackendServiceProtocol { get set }
    var movies: [Movie] { get set }
    var showLoading: Bool { get set }
    var navigationPath: NavigationPath { get set }
    func handle(action: Action)
    func getMovies() async
}

@Observable
class MoviesViewModel: MoviesViewModelProtocol {
    var backendService: BackendServiceProtocol
    var showLoading: Bool = false
    var movies: [Movie] = []
    var navigationPath = NavigationPath()

    init(backendService: BackendServiceProtocol = BackendService()) {
        self.backendService = backendService

        Task { await getMovies() }
    }
    
    @MainActor
    func handle(action: Action) {
        switch action {
        case .movieTapped(let movie):
            showMovieDetail(with: movie)
        }
    }

    @MainActor
    func getMovies() async {
        do {
            showLoading = true
            let movies = try await backendService.getMovies().results
            await MainActor.run {
                showLoading = false
                self.movies = movies
            }
        } catch {
            showLoading = false
            print(error.localizedDescription)
        }
    }

    private func showMovieDetail(with movie: Movie) {
        navigationPath.append(Screen.movieDetail(movie))
    }
}

extension MoviesViewModel {

    enum Action {
        case movieTapped(Movie)
    }

    enum Screen: StarWarsScreen {
        case movieDetail(Movie)
    }
}
