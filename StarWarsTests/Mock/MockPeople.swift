//
//  MockPeople.swift
//  StarWarsTests
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation
@testable import StarWars

extension People {

    static let mockCharacters = [
        Character(
            birthYear: "19BBY",
            eyeColor: "blue",
            films: [
                "A New Hope",
                "The Empire Strikes Back",
                "Return of the Jedi"
            ],
            gender: "male",
            hairColor: "blond",
            name: "Luke Skywalker"
        ),
        Character(
            birthYear: "112BBY",
            eyeColor: "yellow",
            films: [
                "A New Hope",
                "The Empire Strikes Back",
                "Return of the Jedi"
            ],
            gender: "n/a",
            hairColor: "n/a",
            name: "C-3PO"
        ),
        Character(
            birthYear: "41.9BBY",
            eyeColor: "yellow",
            films: [
                "The Phantom Menace",
                "Attack of the Clones",
                "Revenge of the Sith"
            ],
            gender: "male",
            hairColor: "none",
            name: "Darth Vader"
        )
    ]

    static let mockPeople = People(result: mockCharacters)
}
