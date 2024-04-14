//
//  View+Extension.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

extension View {

    func optionalTitle(_ title: String?) -> some View {
        modifier(NavigationTitleModifier(title: title))
    }

    func button(_ action: @escaping () -> Void) -> some View {
        modifier(ButtonModifier(action: action))
    }

    func showLoading(_ isLoading: Bool) -> some View {
        modifier(LoadingModifier(isLoading: isLoading))
    }
}
