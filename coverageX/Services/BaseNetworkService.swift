//
//  BaseNetworkService.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

//Ideally an abstracted layer that invokes Alamofire
final class BaseNetworkService: NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
        guard let request = endpoint.urlRequest else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}

//TODO: Move these somewhere else
struct Endpoint {
    let path: String
    let method: HTTPMethods
    let queryItems: [URLQueryItem]?

    var urlRequest: URLRequest? {
        var components = URLComponents(string: path)
        components?.queryItems = queryItems
        
        guard let url = components?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
