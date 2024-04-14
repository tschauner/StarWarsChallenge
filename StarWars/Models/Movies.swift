//
//  Movies.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

struct Movies: Codable, Equatable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable, Hashable, Equatable {
    let id = UUID().uuidString
    let title: String?
    let openingCrawl, director, producer: String?
    let characters: [String]?
}
