//
//  People.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

struct People: Codable, Equatable {
    let result: [Character]
}

struct Character: Codable, Equatable {
    let birthYear: String?
    let eyeColor: String?
    let films: [String]?
    let gender: String?
    let hairColor: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case films
        case gender
        case name
    }
}
