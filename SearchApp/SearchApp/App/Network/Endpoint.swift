//
//  Endpoint.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

protocol Endpoint {
    var url: URL? {get}
}

struct SearchEndpoint: Endpoint {
    private let baseUrlScheme = "https"
    private let baseUrlHost = "bdk0sta2n0.execute-api.eu-west-1.amazonaws.com"
                    
    let path: String
    let queryItems: [URLQueryItem]
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = baseUrlScheme
        components.host = baseUrlHost
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    static func searchBy(query: String, page: Int) -> Endpoint {
        return SearchEndpoint(
            path: "/mobile-assignment/search",
            queryItems: [URLQueryItem(name: "query", value: query),
                         URLQueryItem(name: "page", value: String(page))]
        )
    }
}

