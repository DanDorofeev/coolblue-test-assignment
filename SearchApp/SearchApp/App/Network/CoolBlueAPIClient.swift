//
//  CoolBlueAPIClient.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import Combine

protocol APIClient {
    func searchBy(query: String, page: Int) -> AnyPublisher<ProductsPage, Error>
}

final class CoolBlueAPIClient: APIClient {
                    
    private let dataLoader: DataLoaderProtocol
                        
    //MARK: - Lifecycle
    
    init(dataLoader: DataLoaderProtocol = DataLoader()) {
        self.dataLoader = dataLoader
    }
    
    func searchBy(query: String, page: Int) -> AnyPublisher<ProductsPage, Error> {        
        dataLoader.execute(SearchEndpoint.searchBy(query: query, page: page), httpMethod: .get, decodingType: ProductsPage.self, queue: .main, retries: 0)
    }
}
