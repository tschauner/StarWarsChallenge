//
//  MockBackendService.swift
//  StarWarsTests
//
//  Created by Philipp Tschauner on 14.04.24.
//

@testable import StarWars
import XCTest

class MockBackendService: BackendServiceProtocol {
    var shouldSucceed = true
    var expectation: XCTestExpectation?
    var getMoviesCalled = false
    var getPeopleCalled = false
    var returningMovies: Movies = Movies.mockMovies
    var returningPeople: People = People.mockPeople

    func getMovies() async throws -> StarWars.Movies {
        defer {
            getMoviesCalled = true
            expectation?.fulfill()
        }

        if shouldSucceed {
            return returningMovies
        } else {
            throw APIError.general
        }
    }
    
    func getPeople() async throws -> StarWars.People {
        defer {
            getPeopleCalled = true
            expectation?.fulfill()
        }

        if shouldSucceed {
            return returningPeople
        } else {
            throw APIError.general
        }
    }
}
