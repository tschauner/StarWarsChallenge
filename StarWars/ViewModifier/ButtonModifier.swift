//
//  ButtonModifier.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    var action: () -> Void

    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            content
        }
    }
}
