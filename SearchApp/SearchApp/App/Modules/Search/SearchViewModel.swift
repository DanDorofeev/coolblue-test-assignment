//
//  SearchViewModel.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
    var searchQuery: String {get set}
    var products: [Product]? {get}
    var showError: Bool {get}
    
    func searchBy(query: String)
    func loadMoreContentIfNeeded(currentProduct product: Product)
}

final class SearchViewModel: SearchViewModelProtocol {
        
    @Published private(set) var products: [Product]?
    @Published private(set) var showError = false
    @Published var searchQuery: String = "" {
        didSet {
            clearResults()
        }
    }
        
    private let apiClient: APIClient
    private var cancellable: AnyCancellable?
    
    //pagination
    private let offsetBeforeLoadNextPage = 2
    private var maxRequestedPage = 1
    private var canLoadMorePages = true
    
    init(apiClient: APIClient = CoolBlueAPIClient()) {
        self.apiClient = apiClient
    }
    
    func searchBy(query: String) {
        guard canLoadMorePages else { return }
        
        guard !query.isEmpty else {
            products = nil
            return
        }
        cancellable = apiClient.searchBy(query: query, page: maxRequestedPage)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    debugPrint(error.localizedDescription)
                    self?.showError = true
                }
            } receiveValue: { [weak self] result in
                self?.searchDidSuccess(with: result)
            }
    }
    
    public func loadMoreContentIfNeeded(currentProduct product: Product) {
        guard let products = products else { return }
        let thresholdIndex = products.index(products.endIndex, offsetBy: -offsetBeforeLoadNextPage)
        if products.firstIndex(where: { $0.productId == product.productId }) == thresholdIndex {
            searchBy(query: searchQuery)
        }
    }
    
    // MARK: - Private
    
    private func searchDidSuccess(with result: ProductsPage) {
        canLoadMorePages = result.totalResults - result.pageSize * maxRequestedPage > 0
        maxRequestedPage += 1
        self.products?.append(contentsOf: result.products)
    }
    
    private func clearResults() {
        products?.removeAll()
        products = [Product]()
        maxRequestedPage = 1
        canLoadMorePages = true
    }
}
