//
//  StarWarsApp.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

@main
struct StarWarsApp: App {
    @State private var viewModel = MoviesViewModel()

    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: viewModel)
        }
    }
}
