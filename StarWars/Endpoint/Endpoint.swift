//
//  Endpoint.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

enum Endpoint {
    case getMovies
    case getPeople
    case getPlanets
    case getCharacter(String)

    var path: String {
        switch self {
        case .getMovies:
            return "films"
        case .getPeople:
            return "people"
        case .getPlanets:
            return "planets"
        case .getCharacter(let id):
            return "people/\(id)"
        }
    }

    var baseURLString: String {
        "https://swapi.dev/api/"
    }

    var url: URL? {
        return URL(string: baseURLString + path)
    }

    func request() throws -> URLRequest {
        guard let url else { throw APIError.urlRequestFailed }
        return URLRequest(url: url)
    }
}
