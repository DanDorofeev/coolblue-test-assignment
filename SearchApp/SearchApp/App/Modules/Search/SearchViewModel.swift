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
}

final class SearchViewModel: SearchViewModelProtocol {
        
    @Published private(set) var products: [Product]?
    @Published private(set) var showError = false
    @Published var searchQuery: String = ""
    
    private let apiClient: APIClient
    private var cancellable: AnyCancellable?
    
    init(apiClient: APIClient = CoolBlueAPIClient()) {
        self.apiClient = apiClient
    }
    
    func searchBy(query: String) {
        guard !query.isEmpty else {
            products = nil
            return
        }
        cancellable = apiClient.searchBy(query: query, page: 1)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    debugPrint(error.localizedDescription)
                    self?.showError = true
                }
            } receiveValue: { [weak self] result in
                self?.products = result.products
            }
    }
}
