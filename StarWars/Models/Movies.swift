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

struct Movie: Codable, Equatable {
    let title: String?
    let episodeID: Int?
    let openingCrawl, director, producer, releaseDate: String?
    let characters, planets, starships, vehicles: [String]?
    let species: [String]?
    let created, edited: String?
    let url: String?
}
