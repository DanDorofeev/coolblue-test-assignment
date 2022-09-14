//
//  SearchAppUITests.swift
//  SearchAppUITests
//
//  Created by Daniil Dorofieiev on 14.09.22.
//

import Foundation
import XCTest
@testable import SearchApp

class SearchAppUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testLisIsEmptyAfterStart() {
        XCTAssertTrue(emptyView.exists)
    }
    
    func testSearchIsVisible() {
        XCTAssertTrue(searchField.exists)
        searchField.tap()
        XCTAssertTrue(searchCancelButton.exists)
        XCTAssertTrue(searchClearButton.exists)
        XCTAssertTrue(emptyView.exists)
    }
    
    func testSearchFunctionality() {
        startSearch()
        XCTAssertFalse(emptyView.exists)
        XCTAssertTrue(productList.exists)
    }
    
    func testClearSearchResults() {
        startSearch()
        XCTAssertTrue(productList.exists)
        searchClearButton.tap()
        XCTAssertTrue(emptyView.exists)
    }
    
    func testListResultsScroll() {
        startSearch()
        scrollView.swipeUp()
    }
    
    // MARK: - Private
    
    private func startSearch() {
        searchField.tap()
        searchField.typeText("Apple")
    }
}

extension SearchAppUITests {
            
    var scrollView: XCUIElement {
        app.scrollViews.firstMatch
    }
    
    var emptyView: XCUIElement {
        app.descendants(matching: .any)[AccessibilityIdentifiers.Views.emptyView.rawValue]
    }
    
    var errorView: XCUIElement {
        app.descendants(matching: .any)[AccessibilityIdentifiers.Views.errorView.rawValue]
    }
            
    var searchField: XCUIElement {
        app.searchFields["Search"]
    }
    
    var searchCancelButton: XCUIElement {
        searchField.buttons["Cancel"]
    }
    
    var searchClearButton: XCUIElement {
        searchField.buttons["Clear text"]
    }
    
    var productList: XCUIElement {
        app.scrollViews.firstMatch
    }
}
