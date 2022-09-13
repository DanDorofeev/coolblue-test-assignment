//
//  CoolBlueAPIClientTests.swift
//  SearchAppTests
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import XCTest
import Combine
@testable import SearchApp

class CoolBlueAPIClientTests: XCTestCase {
        
    private let dataLoaderSuccessMock = DataLoaderSuccessMock()
    private let dataLoaderFailsMock = DataLoaderFailsMock()
    private var apiClient: CoolBlueAPIClient!
    var subscriptions: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        subscriptions = Set<AnyCancellable>()
    }
    
    func testSearchSuccess() {
        apiClient = CoolBlueAPIClient(dataLoader: dataLoaderSuccessMock)
        dataLoaderSuccessMock.testData = try! JSONEncoder().encode(Products.example)
        subscriptions.insert(apiClient.searchBy(query: "apple", page: 1)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure:
                    XCTFail("Unexpected fail")
                case .finished:
                    break
                }
            }, receiveValue: { products in
                XCTAssertEqual(products.data.count, 2)
                XCTAssertEqual(products.data.first, Product.example1)
                XCTAssertEqual(products.data.last, Product.example2)
            }))
    }
    
    func testSearchFails() {
        apiClient = CoolBlueAPIClient(dataLoader: dataLoaderFailsMock)
        dataLoaderFailsMock.error = NSError(domain: "Test Error", code: -10001, userInfo: nil)
        subscriptions.insert(apiClient.searchBy(query: "apple", page: 1)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    let errorCode = (error as NSError).code
                    XCTAssertEqual(errorCode, -10001)
                case .finished:
                    break
                }
            }, receiveValue: { _ in
                XCTFail("Unexpected success")
            }))
    }
}
