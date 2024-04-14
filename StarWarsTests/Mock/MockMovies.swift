//
//  MockMovies.swift
//  StarWarsTests
//
//  Created by Philipp Tschauner on 14.04.24.
//

@testable import StarWars

extension Movies {

    static let mockMovies = Movies(
        results: [
            Movie(
                title: "A New Hope",
                openingCrawl: "It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.",
                director: "George Lucas",
                producer: "Gary Kurtz",
                characters: [
                    "Luke Skywalker",
                    "Leia Organa",
                    "Han Solo"
                ]
            ),
            Movie(
                title: "The Empire Strikes Back",
                openingCrawl: "The Empire has been repulsed, but its desperation makes it more dangerous. The ultimate battle for freedom has not yet begun.",
                director: "Irvin Kershner",
                producer: "Gary Kurtz",
                characters: [
                    "Luke Skywalker",
                    "Darth Vader"
                ]
            ),
            Movie(
                title: "Return of the Jedi",
                openingCrawl: "Luke Skywalker has returned to his home planet of Tatooine in an attempt to rescue his friend Han Solo from the clutches of the vile gangster Jabba the Hutt.",
                director: "Richard Marquand",
                producer: "Howard G. Kazanjian",
                characters: [
                    "Luke Skywalker",
                    "Leia Organa",
                    "Darth Vader"
                ]
            )
        ]
    )
}


