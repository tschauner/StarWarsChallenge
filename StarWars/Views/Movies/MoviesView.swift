//
//  MoviesView.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct MoviesView<T: MoviesViewModelProtocol>: View where T.Action == MoviesViewModel.Action {
    @State var viewModel: T

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            List {
                ForEach(viewModel.movies, id: \.id) { movie in
                    MovieRowView(movie: movie)
                        .button {
                            viewModel.handle(action: .movieTapped(movie))
                        }
                }
            }
            .listStyle(.plain)
            .padding(.top, 15)
            .navigationTitle("Movies")
            .task {
                viewModel.getMovies()
            }
            .navigationDestination(for: MoviesViewModel.Screen.self, destination: view)
        }
    }
    
    @ViewBuilder
    private func view(for screen: MoviesViewModel.Screen) -> some View {
        switch screen {
        case .movieDetail(let movie):
            MovieDetailView(movie: movie)
        }
    }
}
