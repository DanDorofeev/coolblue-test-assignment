//
//  EndpointTests.swift
//  SearchAppTests
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import XCTest
@testable import SearchApp

class EndpointTests: XCTestCase {
    
    func testProductEndpoint() {
        let endpoint = SearchEndpoint.searchBy(query: "apple", page: 1)
        let url = endpoint.url?.absoluteString
        XCTAssertEqual(url, "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search?query=apple&page=1")
        XCTAssertNotEqual(url, "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search?query=test&page=1")
    }
}
