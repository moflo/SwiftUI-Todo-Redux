//
//  ContentView.swift
//  SwiftUI-Todo-Redux
//
//  Created by moflo on 6/22/19.
//  Copyright © 2019 Mobile Flow LLC. All rights reserved.
//

import Foundation

struct DataStore {
    static let shared = DataStore()

    let baseURL = URL(string: "http://www.mocky.io/v2/")!
    let apiKey = "5d0ef6093200005700dc694d"
    let decoder = JSONDecoder()

    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }

    enum Endpoint {
        case users
        case user(id: String)
        case tasks
        case task(id: String)

        func path() -> String {
            switch self {
            case .users:
                return "5d0ef6093200005700dc694d"
            case let .user(id):
                return "5d0ef6093200005700dc694d/\(id)"
            case .tasks:
                return "5d0ef6093200005700dc694d"
            case let .task(id):
                return "5d0ef6093200005700dc694d/\(id)"
            }
        }
    }

    func GET<T: Codable>(endpoint: Endpoint,
                         params: [String: String]?,
                         completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
        ]
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completionHandler(.failure(.noResponse))
                return
            }
            guard error == nil else {
                completionHandler(.failure(.networkError(error: error!)))
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                completionHandler(.success(object))
            } catch {
                print("JSON decoding error (GET)", T.self, error)
                completionHandler(.failure(.jsonDecodingError(error: error)))
            }
        }
        task.resume()
    }

    func POST<T: Codable>(endpoint: Endpoint,
                          params: [String: String]?,
                          completionHandler: @escaping (Result<T, APIError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint.path())
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
        ]
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completionHandler(.failure(.noResponse))
                return
            }
            guard error == nil else {
                completionHandler(.failure(.networkError(error: error!)))
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                completionHandler(.success(object))
            } catch {
                print("JSON decoding error (POST)", T.self, error)
                completionHandler(.failure(.jsonDecodingError(error: error)))
            }
        }
        task.resume()
    }
}
