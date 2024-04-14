//
//  MovieDetailViewModel.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    associatedtype Action
    var backendService: BackendServiceProtocol { get set }
    func handle(action: Action)
    var movie: Movie { get set }
    func getAndShowPeople()
}

@Observable
class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var backendService: BackendServiceProtocol
    var movie: Movie

    init(movie: Movie,
         backendService: BackendServiceProtocol = BackendService()
    ) {
        self.backendService = backendService
        self.movie = movie
    }

    @MainActor
    func handle(action: Action) {
        switch action {
        case .showPeople:
            getAndShowPeople()
        }
    }

    @MainActor
    func getAndShowPeople() {
        Task {
            do {
                let characters = try await backendService.getPeople().result
                await MainActor.run {
                    showPeople(with: characters)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func showPeople(with characters: [Character]) {

    }
}

extension MovieDetailViewModel {

    enum Action {
        case showPeople
    }
}
