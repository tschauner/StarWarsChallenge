//
//  MovieDetailView.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct MovieDetailView<T: MovieDetailViewModelProtocol>: View where T.Action == MovieDetailViewModel.Action {
    @State var viewModel: T

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title = viewModel.movie.title {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let description = viewModel.movie.openingCrawl {
                Text(description)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let director = viewModel.movie.director {
                Text("Director: " + director)
            }

            if let producer = viewModel.movie.producer {
                Text("Producer: " + producer)
            }

            Text("Show cast")
                .foregroundStyle(Color.blue)
                .font(Font.system(size: 17, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .button {
                    viewModel.handle(action: .showPeople)
                }
                .padding(.top, 20)

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .optionalTitle(viewModel.movie.title)
    }
}
