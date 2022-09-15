//
//  DataLoader.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Combine
import UIKit

protocol DataLoaderProtocol {    
    func execute<T>(_ endpoint: Endpoint, httpMethod: String, decodingType: T.Type, queue: DispatchQueue, retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

final class DataLoader: DataLoaderProtocol {
    
    let session: URLSession
        
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
                
    func execute<T>(_ endpoint: Endpoint,
                    httpMethod: String = "GET",
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        
        guard let url = endpoint.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.httpMethod = httpMethod
        
        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIError.responseUnsuccessful
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
