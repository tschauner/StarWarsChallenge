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
}
