//
//  MovieDetailView.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 10) {
            if let title = movie.title {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let description = movie.openingCrawl {
                Text(description)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let director = movie.director {
                Text("Director: " + director)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if let producer = movie.producer {
                Text("Producer: " + producer)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()
        }
        .padding(15)
        .optionalTitle(movie.title)
    }
}
