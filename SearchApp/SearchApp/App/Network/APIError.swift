//
//  APIError.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case responseUnsuccessful

    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        }
    }
}
