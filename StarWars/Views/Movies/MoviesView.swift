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
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                MovieRowView(movie: movie)
                    .onTapGesture {
                        viewModel.handle(action: .movieTapped)
                    }
            }
        }
        .listStyle(.plain)
        .padding()
        .navigationTitle("Movies")
        .task {
            viewModel.getMovies()
        }
    }
}
