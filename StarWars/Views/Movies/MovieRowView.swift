//
//  MovieView.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 15) {
            Image(icon: .popcorn)

            VStack {
                if let title = movie.title {
                    Text(title)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                if let director = movie.director {
                    Text("Directed by: " + director)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            Image(icon: .chevronRight)
        }
    }
}
