//
//  SearchViewModelTests.swift
//  SearchAppTests
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import XCTest
import Combine
@testable import SearchApp

class SearchViewModelTests: XCTestCase {
    
    private var viewModel: SearchViewModel!
    private var apiClientSuccess: CoolBlueAPIClientProtocol!
    private var apiClientFails: CoolBlueAPIClientProtocol!
    
    override func setUp() {
        super.setUp()
        apiClientSuccess = CoolBlueAPIClientMock()
        apiClientFails = CoolBlueAPIClientFailsMock()
    }
    
    func testProductsSuccess() {
        viewModel = SearchViewModel(apiClient: apiClientSuccess)
        viewModel.searchBy(query: "apple")
        XCTAssertEqual(viewModel.products?.count, 2)
        XCTAssertEqual(viewModel.products?.first, Product.example1)
        XCTAssertEqual(viewModel.products?.last, Product.example2)
        XCTAssertFalse(viewModel.products?.contains(Product.example3) ?? true)
    }
    
    func testShowError() {
        viewModel = SearchViewModel(apiClient: apiClientFails)
        XCTAssertFalse(viewModel.showError)
        viewModel.searchBy(query: "apple")
        XCTAssertTrue(viewModel.showError)
    }
}
