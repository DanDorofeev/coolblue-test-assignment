//
//  CoolBlueAPIClientMock.swift
//  SearchAppTests
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import Foundation
import Combine
@testable import SearchApp

final class CoolBlueAPIClientMock: CoolBlueAPIClientProtocol {
    func searchBy(query: String, page: Int) -> AnyPublisher<Products, Error> {
        return Just(Products.example)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

final class CoolBlueAPIClientFailsMock: CoolBlueAPIClientProtocol {
    func searchBy(query: String, page: Int) -> AnyPublisher<Products, Error> {
        let error = NSError(domain: "Test Error", code: -10001, userInfo: nil)
        return Fail(error: error).eraseToAnyPublisher()
    }
}
