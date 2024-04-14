//
//  LoadingModifier.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    var isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            content
                .overlay(
                    ProgressView()
                )
                .disabled(true)
        } else {
            content
        }
    }
}
