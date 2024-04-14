//
//  APIService.swift
//  StarWars
//
//  Created by Philipp Tschauner on 14.04.24.
//

import Foundation

enum APIError: Error {
    case decodingFailed
    case urlRequestFailed
    case general
}

class APIService {
    static let shared = APIService()

    func get<T: Codable>(_ endpoint: Endpoint) async throws -> T {
        let data = try await data(for: endpoint).data
        let decoder = JSONDecoder()
        guard let model: T = handleDecoding(decoder: decoder, data: data) else {
            throw APIError.decodingFailed
        }
        return model
    }

    private func data(for endpoint: Endpoint) async throws -> (data: Data, response: URLResponse) {
        return try await URLSession.shared.data(for: endpoint.request())
    }

    private func handleDecoding<T: Codable>(decoder: JSONDecoder, data: Data) -> T? {
        do {
            let decoded = try decoder.decode(T?.self, from: data)
            return decoded
        } catch  {
            print("error: ", error)
            if let dataString = String(decoding: data, as: UTF8.self) as? T {
                print(dataString)
                return nil
            } else {
                return nil
            }
        }
    }
}
