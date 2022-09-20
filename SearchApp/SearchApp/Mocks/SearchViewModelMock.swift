//
//  SearchViewModelMock.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

#if DEBUG

final class SearchViewModelMock: SearchViewModelProtocol {
    func loadMoreContentIfNeeded(currentProduct product: Product) {
        
    }
    
    var searchQuery: String = ""
        
    var showError = false
        
    var products: [Product]?
    
    func searchBy(query: String) {}
}
#endif
