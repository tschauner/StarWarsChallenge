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
    var showLoading: Bool { get set }
    func handle(action: Action)
    var movie: Movie { get set }
    func getAndShowPeople()
}

@Observable
class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var backendService: BackendServiceProtocol
    var showLoading: Bool = false
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
                showLoading = true
                let characters = try await backendService.getPeople().result
                await MainActor.run {
                    showLoading = false
                    showPeople(with: characters)
                }
            } catch {
                showLoading = false
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
