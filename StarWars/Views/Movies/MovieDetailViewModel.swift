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
    var errorReportingService: ErrorReportingServiceProtocol { get set }
    var showLoading: Bool { get set }
    func handle(action: Action)
    var movie: Movie { get set }
    func getAndShowPeople()
}

@Observable
class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var backendService: BackendServiceProtocol
    var errorReportingService: ErrorReportingServiceProtocol
    var showLoading: Bool = false
    var movie: Movie

    init(movie: Movie,
         backendService: BackendServiceProtocol = BackendService(),
         errorReportingService: ErrorReportingServiceProtocol = ErrorReportingService()
    ) {
        self.movie = movie
        self.backendService = backendService
        self.errorReportingService = errorReportingService
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
                errorReportingService.report(error: error)
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
