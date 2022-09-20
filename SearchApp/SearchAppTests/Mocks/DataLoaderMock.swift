//
//  DataLoaderMock.swift
//  SearchAppTests
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import XCTest
import Combine
@testable import SearchApp

class DataLoaderSuccessMock: DataLoaderProtocol {
    
    var testData: Data!
    
    func execute<T>(_ endpoint: Endpoint, httpMethod: HTTPMethod, decodingType: T.Type, queue: DispatchQueue, retries: Int) -> AnyPublisher<T, Error> where T : Decodable {
        let decodedData = try! JSONDecoder().decode(T.self, from: testData)
        return Just(decodedData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

class DataLoaderFailsMock: DataLoaderProtocol {
    
    var error: NSError!
    
    func execute<T>(_ endpoint: Endpoint, httpMethod: HTTPMethod, decodingType: T.Type, queue: DispatchQueue, retries: Int) -> AnyPublisher<T, Error> where T : Decodable {
        return Fail(error: error).eraseToAnyPublisher()
    }
}
