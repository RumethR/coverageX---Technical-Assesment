//
//  NetworkError.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

//Generated using ChatGPT
enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .noData: return "No data received"
        case .decodingError: return "Failed to decode response"
        case .serverError(let code): return "Server error (code: \(code))"
        case .unknown: return "Unknown error occurred"
        }
    }
}
