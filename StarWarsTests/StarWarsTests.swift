//
//  StarWarsTests.swift
//  StarWarsTests
//
//  Created by Philipp Tschauner on 14.04.24.
//

import XCTest
@testable import StarWars

final class StarWarsTests: XCTestCase {
    var sut: MoviesViewModel!
    var mockBackendService: MockBackendService!
    var mockErrorReportingService: MockErrorReportingService!

    override func setUpWithError() throws {
        mockBackendService = MockBackendService()
        mockErrorReportingService = MockErrorReportingService()
        sut = .init(
            backendService: mockBackendService,
            errorReportingService: mockErrorReportingService
        )
    }

    override func tearDownWithError() throws {
        mockBackendService = nil
        mockErrorReportingService = nil
        sut = nil
    }
    
    @MainActor
    func test_movieTapped_succeed() async {
        // Given
        let expectation = XCTestExpectation(description: "getMoviesExpectation")
        mockBackendService.expectation = expectation

        // When
        let movie = Movies.mockMovies.results[0]
        sut.handle(action: .movieTapped(movie))
        await fulfillment(of: [expectation])

        // Then
        XCTAssertEqual(sut.navigationPath.count, 1)
        XCTAssertTrue(mockBackendService.getMoviesCalled)
    }

    @MainActor
    func test_movieTapped_fail() async {
        // Given
        let expectation = XCTestExpectation(description: "getMoviesExpectation")
        mockErrorReportingService.expectation = expectation
        mockBackendService.shouldSucceed = false

        // When
        let movie = Movies.mockMovies.results[0]
        sut.handle(action: .movieTapped(movie))
        await fulfillment(of: [expectation])

        // Then
        XCTAssertTrue(mockBackendService.getMoviesCalled)
        XCTAssertEqual(mockErrorReportingService.reportableMessage, "The operation couldn’t be completed. (StarWars.APIError error 2.)")
    }
}
