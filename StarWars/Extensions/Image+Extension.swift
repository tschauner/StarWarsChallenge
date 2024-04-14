//
//  Image+Extension.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import SwiftUI

extension SwiftUI.Image {

    init(icon: StarWarsIcon) {
        self.init(systemName: icon.rawValue)
    }
}
