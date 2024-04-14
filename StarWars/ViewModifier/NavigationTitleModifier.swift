//
//  NavigationTitleModifier.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct NavigationTitleModifier: ViewModifier {
    let title: String?

    func body(content: Content) -> some View {
        if let title {
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
        } else {
            content
        }
    }
}
