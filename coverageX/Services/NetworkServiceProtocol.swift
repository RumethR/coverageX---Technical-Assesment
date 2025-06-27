//
//  NetworkServiceProtocol.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

protocol NetworkService {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T
}
