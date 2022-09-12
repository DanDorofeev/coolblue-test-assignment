//
//  CoolBlueAPIClient.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import Combine

protocol CoolBlueAPIClientProtocol {
    func searchBy(query: String, page: Int) -> AnyPublisher<Products, Error>
}

final class CoolBlueAPIClient: DataLoader, CoolBlueAPIClientProtocol {

    let session: URLSession
        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
                
    func searchBy(query: String, page: Int) -> AnyPublisher<Products, Error> {
        execute(Endpoint.searchBy(query: query, page: page), decodingType: Products.self)
    }
}
