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

final class CoolBlueAPIClient: CoolBlueAPIClientProtocol {
                    
    private let dataLoader: DataLoaderProtocol
                        
    //MARK: - Lifecycle
    
    init(dataLoader: DataLoaderProtocol = DataLoader()) {
        self.dataLoader = dataLoader
    }
    
    func searchBy(query: String, page: Int) -> AnyPublisher<Products, Error> {        
        dataLoader.execute(Endpoint.searchBy(query: query, page: page), decodingType: Products.self, queue: .main, retries: 0)
    }
}
